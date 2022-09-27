#!/usr/bin/env python3

import argparse
import logging as log
import os
import re
import shutil
import subprocess
import sys

def softlink_homedir_contents(force_overwrite):
    script_dir = os.path.dirname(os.path.realpath(__file__))
    homedir_contents_dir = os.path.join(script_dir, 'homedir_files')
    if not os.path.isdir(homedir_contents_dir):
        log.error("homedir_contents directory not found in script directory.")
        sys.exit(1)

    for file in os.listdir(homedir_contents_dir):
        homedir_content = os.path.join(homedir_contents_dir, file)
        softlink_file = os.path.join(os.path.expanduser("~"), f".{file}")

        if os.path.isfile(softlink_file) or os.path.islink(softlink_file) or os.path.isdir(softlink_file):
            log.warning(f"{softlink_file} already exists")
            if not force_overwrite:
                overwrite = input("Overwrite %s? [y/N] " % softlink_file)
                if not re.match(r'^[yY]$', overwrite):
                    continue

            if os.path.islink(softlink_file) or os.path.isfile(softlink_file):
                os.remove(softlink_file)
            else :
                shutil.rmtree(softlink_file)

        log.debug("Softlinking: %s -> %s" % (softlink_file, homedir_content))
        os.symlink(homedir_content, softlink_file)

    log.info("Softlinked homedir contents")

def initialize_submodules():
    # find git executable in path
    git_binary = shutil.which('git')
    if git_binary is None:
        sys.exit("Git not found in path")

    submodule_init_command = [
        git_binary, 'submodule', 'update', '--init', '--recursive'
    ]

    ret = subprocess.run(submodule_init_command, capture_output=True)
    ret.check_returncode()

    log.info("Initialized submodules")

def install_fish_shell_tools(force_install):
    shell = os.environ.get('SHELL')
    if shell is None or re.match(r'.*fish', shell) is None:
        log.warning("fish is not the default shell, skipping fish shell tools installation")
        return

    os.system("fish -C \"curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher && exit\"")

    fish_plugins = ['jorgebucaran/replay.fish', 'aral/tide', 'dracula/fish', 'jethrokuan/z']
    for plugin in fish_plugins:
        os.system(f"fish -C \"fisher install {plugin} && exit\"")

def install_homebrew_packages():
    brew_binary = shutil.which('brew')
    if brew_binary is None:
        log.warning("Homebrew not found in path, skipping homebrew package installation")
        return

    brew_list_command = [
        brew_binary, 'list'
    ]
    ret = subprocess.run(brew_list_command, capture_output=True)
    ret.check_returncode()

    # convert to list of packages
    installed_packages = ret.stdout.decode('utf-8').split('\n')

    packages = ['bat',
                'tmux',
                'nvim',
                'fd',
                'fzf',
                'git-delta',
                'mosh',
                'meson',
                'the_silver_searcher']

    for package in packages:
        if package in installed_packages:
            log.info(f"Homebrew {package} already installed, skipping...")
            continue

        brew_install_command = [
            brew_binary, 'install', package
        ]

        log.info(f"Installing {package} with Homebrew...")

        ret = subprocess.run(brew_install_command, capture_output=True)
        ret.check_returncode()

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('-f',
                        '--force',
                        help='Overwite existing files if they exist.',
                        action='store_true',
                        default=False)
    parser.add_argument('-v',
                        '--verbose',
                        help='Verbose output.',
                        action='store_true',
                        default=False)
    args = parser.parse_args()

    if args.verbose:
        log.basicConfig(format="%(levelname)s: [%(threadName)s]: %(message)s", level=log.DEBUG)
    else:
        log.basicConfig(format="%(levelname)s: [%(threadName)s]: %(message)s", level=log.INFO)

    initialize_submodules()
    install_homebrew_packages()
    softlink_homedir_contents(args.force)
    install_fish_shell_tools(args.force)

if __name__ == '__main__':
    main()
