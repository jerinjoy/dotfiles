#!/bin/bash
# Reads Claude Code context JSON from stdin and outputs a status line
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // empty' 2>/dev/null)
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty' 2>/dev/null)
used_tokens=$(echo "$input" | jq -r '.context_window.total_input_tokens // empty' 2>/dev/null)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty' 2>/dev/null)

parts=()
[[ -n "$model" ]] && parts+=("$model")
if [[ -n "$used_pct" ]]; then
    ctx_label="ctx: $(printf '%.0f' "$used_pct")%"
    if [[ -n "$used_tokens" ]]; then
        ctx_label="$ctx_label ($(( used_tokens / 1000 ))k tokens)"
    fi
    parts+=("$ctx_label used")
fi
[[ -n "$cwd" ]] && parts+=("$cwd")

if [[ ${#parts[@]} -eq 0 ]]; then
    echo ""
else
    IFS=" | "
    echo "${parts[*]}"
fi
