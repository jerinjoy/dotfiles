#!/usr/bin/env python3

# SPDX-FileCopyrightText: 2023 Jerin Joy
#
# SPDX-License-Identifier: Apache-2.0

import argparse
import logging as log
import os
import re
import shutil
import signal
import subprocess
import sys

import yaml


def run_command_and_return_stdout(command, run_directory):
    log.debug(f"Running command: {' '.join(command)}")
    group_pid = None
    try:
        p = subprocess.Popen(
            command,
            cwd=run_directory,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            preexec_fn=os.setsid,  # Assign the child and all its subprocesses to a new process group.
        )
        group_pid = os.getpgid(p.pid)
        stdout, stderr = p.communicate()
        returncode = p.wait()
        if returncode != 0:
            log.error(f"Command: {' '.join(command)} failed.")
            log.error(stdout.decode())
            log.error(stderr.decode())
            raise Exception(f"Command: {' '.join(command)} failed.")
        log.debug(stdout.decode())
        log.debug(stderr.decode())
        return stdout
    except KeyboardInterrupt:
        log.error(f"Command: {' '.join(command)} interrupted.")
        if group_pid is not None:
            # p.kill() seems to only kill the child process and not the
            # subprocesses of the child. This leaves the subprocesses of the
            # child orphaned.
            # Instead, kill the whole process group containing the child process
            # and it's subprocesses.
            os.killpg(group_pid, signal.SIGTERM)
        raise Exception(f"Command: {' '.join(command)} interrupted.")


def softlink_to_homedir(source_dir, force_overwrite):
    script_dir = os.path.dirname(os.path.realpath(__file__))
    dir_with_files_to_softlink = os.path.join(script_dir, source_dir)
    if not os.path.isdir(dir_with_files_to_softlink):
        log.error(f"{source_dir} directory not found in script directory.")
        sys.exit(1)

    for file in os.listdir(dir_with_files_to_softlink):
        dotfile = os.path.join(dir_with_files_to_softlink, file)
        dotfile_softlink = os.path.join(os.path.expanduser("~"), f".{file}")

        if (
            os.path.isfile(dotfile_softlink)
            or os.path.islink(dotfile_softlink)
            or os.path.isdir(dotfile_softlink)
        ):
            log.warning(f"{dotfile_softlink} already exists")
            if not force_overwrite:
                overwrite = input(f"Overwrite {dotfile_softlink}? [y/N] ")
                if not re.match(r"^[yY]$", overwrite):
                    continue

            if os.path.islink(dotfile_softlink) or os.path.isfile(dotfile_softlink):
                os.remove(dotfile_softlink)
            else:
                shutil.rmtree(dotfile_softlink)

        log.debug(f"Softlinking: {dotfile_softlink} -> {dotfile}")
        os.symlink(dotfile, dotfile_softlink)

    log.info("Softlinked homedir contents")


def initialize_submodules():
    # find git executable in path
    git_binary = shutil.which("git")
    if git_binary is None:
        sys.exit("Git not found in path")

    submodule_init_command = [git_binary, "submodule", "update", "--init", "--recursive"]

    run_command_and_return_stdout(
        submodule_init_command, os.path.dirname(os.path.realpath(__file__))
    )

    log.info("Initialized submodules")


class Fisher:
    def __init__(self):
        self.shell = os.environ.get("SHELL")
        if self.shell is None or re.match(r".*fish", self.shell) is None:
            self.shell = None
            log.warning("fish is not the default shell.")
        else:
            result = subprocess.run(["fish", "-v"], capture_output=True, text=True)
            if result.returncode != 0:
                log.error("fish shell is not available in path")
                sys.exit(1)

        self.plugins = set()

    def add_plugins(self, plugins):
        self.plugins.update(plugins)

    def install_plugins(self):
        # Couldn't figure out a way to check if a fish function is installed
        log.info("Installing fisher...")
        os.system(
            'fish -C "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher && exit"'
        )

        for plugin in self.plugins:
            log.info(f"Installing fisher plugin {plugin}...")
            os.system(f'fish -C "fisher install {plugin} && exit"')

    def get_plugins_to_install(self):
        return self.plugins


class Homebrew:
    def __init__(self):
        self.packages_to_install = set()

        self.brew_binary = shutil.which("brew")
        if self.brew_binary is None:
            log.warning("Homebrew not found in path, skipping homebrew package installation")
            return

    def get_installed_packages(self):
        if self.brew_binary is None:
            return None

        brew_list_command = [self.brew_binary, "list"]

        ret = run_command_and_return_stdout(
            brew_list_command, os.path.dirname(os.path.realpath(__file__))
        )

        # convert to list of packages
        installed_packages = ret.decode("utf-8").split("\n")
        return installed_packages

    def add_packages(self, packages):
        self.packages_to_install.update(packages)

    def install_packages(self):
        if self.brew_binary is None:
            log.warning("Homebrew not found in path, skipping homebrew package installation")
            return None

        installed_packages = self.get_installed_packages()

        for package in self.packages_to_install:
            if package in installed_packages:
                log.info(f"Homebrew {package} already installed, skipping...")
                continue

            brew_install_command = [self.brew_binary, "install", package]

            log.info(f"Installing {package} with Homebrew...")

            run_command_and_return_stdout(
                brew_install_command, os.path.dirname(os.path.realpath(__file__))
            )

    def get_packages_to_install(self):
        return self.packages_to_install


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--config_file", help="YAML config file.", required=False, default="config.yaml", type=str
    )
    parser.add_argument(
        "--add_homebrew_packages",
        help="Additional Homebrew packages to install (macOS only)",
        nargs="+",
        required=False,
        default=None,
        type=str,
    )
    parser.add_argument(
        "--add_fish_plugins",
        help="Additional fish plugins to install",
        nargs="+",
        required=False,
        default=None,
        type=str,
    )
    parser.add_argument(
        "-f",
        "--force",
        help="Overwite existing files if they exist.",
        action="store_true",
        default=False,
    )
    parser.add_argument(
        "--dry_run",
        help="List the changes that will be made and the packages that will be installed.",
        action="store_true",
        default=False,
    )
    parser.add_argument(
        "-v", "--verbose", help="Verbose output.", action="store_true", default=False
    )
    args = parser.parse_args()

    if args.verbose:
        log.basicConfig(format="%(levelname)s: [%(threadName)s]: %(message)s", level=log.DEBUG)
    else:
        log.basicConfig(format="%(levelname)s: [%(threadName)s]: %(message)s", level=log.INFO)

    if not os.path.isfile(args.config_file):
        log.error(f"Config file {args.config_file} not found")
        sys.exit(1)

    config_data = None
    with open(args.config_file) as file:
        config_data = yaml.safe_load(file)

    homebrew = Homebrew()
    if "homebrew_packages" in config_data:
        homebrew.add_packages(config_data["homebrew_packages"])
    if args.add_homebrew_packages is not None:
        homebrew.add_packages(args.add_homebrew_packages)

    fisher = Fisher()
    if "fish_plugins" in config_data:
        fisher.add_plugins(config_data["fish_plugins"])
    if args.add_fish_plugins is not None:
        fisher.add_plugins(args.add_fish_plugins)

    file.close()

    if args.dry_run:
        log.info("Dry run, will not make any changes")
        log.info(f"Homebrew Packages to install: {homebrew.get_packages_to_install()}")
        log.info(f"Fish plugins to install: {fisher.get_plugins_to_install()}")
        sys.exit(0)

    initialize_submodules()
    homebrew.install_packages()
    softlink_to_homedir("homedir_files", args.force)
    fisher.install_plugins()


if __name__ == "__main__":
    main()
