# ============================================================
#                 POWERLEVEL10K INSTANT PROMPT
# ============================================================
export POWERLEVEL10K_CURSOR_SHAPE=block
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================
#                     TERMINAL TITLE FUNCTIONS
# ============================================================
function set-term-title-precmd() {
    emulate -L zsh
    [[ -t 1 ]] && print -rn -- $'\e]0;'${(V%):-'%~'}$'\a'
}
function set-term-title-preexec() {
    emulate -L zsh
    [[ -t 1 ]] && print -rn -- $'\e]0;'${(V)1}$'\a'
}
autoload -U compinit
compinit -u
autoload -Uz add-zsh-hook
add-zsh-hook preexec set-term-title-preexec
add-zsh-hook precmd set-term-title-precmd
set-term-title-precmd


# ============================================================
#                     ENVIRONMENT VARIABLES
# ============================================================
export TERM=xterm-256color
export EDITOR=nvim
export PAGER=less

# LESS colors
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# ============================================================
#                          HISTORY
# ============================================================
export HISTFILE="$HOME/.histfile"
export HISTSIZE=1000000
export SAVEHIST=1000000

setopt \
  EXTENDED_HISTORY INC_APPEND_HISTORY INC_APPEND_HISTORY_TIME SHARE_HISTORY \
  HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS \
  HIST_FIND_NO_DUPS HIST_SAVE_NO_DUPS HIST_REDUCE_BLANKS HIST_VERIFY \
  HIST_BEEP INTERACTIVE_COMMENTS MAGIC_EQUAL_SUBST NULL_GLOB AUTO_CD \
  BEEP NOTIFY

unsetopt NO_MATCH NOMATCH

# ============================================================
#                          KEY BINDINGS
# ============================================================
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[2~" overwrite-mode
bindkey "^[[3~" delete-char

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3;5~" kill-word
bindkey "^[[5~" beginning-of-buffer-or-history
bindkey "^[[6~" end-of-buffer-or-history

# History search
autoload -Uz history-substring-search-up history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ============================================================
#                           ALIASES
# ============================================================
alias info="fastfetch"
alias ls="lsd"
alias vim="nvim"
alias top="btop"
alias more="bat"
alias batless="bat"
alias diff="diff --color=auto"
alias mkpass='cd ~ && ./.mkpass.sh'
alias python='python3.9'
# ============================================================
#                        AUTOCOMPLETE
# ============================================================

# Enable menu-style completion
zmodload zsh/complist

# Make TAB open a completion menu like fish
bindkey '^I' menu-complete
bindkey '^[[Z' reverse-menu-complete

# Style: scrolling menu, like fish
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Faster, smarter completion
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' completer _complete _match _approximate

# Show descriptions (git, docker, systemctl etc.)
zstyle ':completion:*:descriptions' format '%F{yellow}%B── %d ──%b%f'
zstyle ':completion:*:messages' format '%F{blue}%d%f'
# ============================================================
#                 POWERLEVEL10K & ZSH PLUGINS
# ============================================================
USE_POWERLINE="true"

[[ -f ~/.config/.zsh/powerlevel10k/powerlevel10k.zsh-theme ]] && \
    source ~/.config/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# Completions
autoload -Uz compinit
compinit -d ~/.cache/zcompdump

# Plugins
[[ -f ~/.config/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source ~/.config/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f ~/.config/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source ~/.config/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f ~/.config/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]] && \
    source ~/.config/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
[[ -f ~/.config/.zsh/zsh-autopair/autopair.zsh ]] && \
    source ~/.config/.zsh/zsh-autopair/autopair.zsh

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#5f5f87'

# ============================================================
#                        ZOXIDE + AUTOJUMP
# ============================================================
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init --cmd z zsh)"
elif command -v autojump &>/dev/null; then
    [[ -s /usr/share/autojump/autojump.zsh ]] && source /usr/share/autojump/autojump.zsh
else
    echo "⚠️ zoxide/autojump not installed!"
fi

# Interactive zoxide/autojump browser via fzf
zi() {
    local list dir
    if command -v zoxide >/dev/null; then
        list="$(zoxide query -l)"
    else
        list="$(autojump -s)"
    fi

    dir=$(echo "$list" | fzf --prompt='📂 jump ❯ ' \
                             --preview='ls -a --color=always {}' \
                             --height=40% --layout=reverse --border)
    [[ -n "$dir" ]] && cd "$dir"
}

# ============================================================
#                           FZF
# ============================================================
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git 2>/dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS="
  --layout=reverse
  --border
  --height=40%
  --preview '([[ -d {} ]] && ls -a --color=always {} || (bat --style=numbers --color=always --line-range :300 {} 2>/dev/null || cat {}))'
  --preview-window=right:60%
"

# Load FZF keybindings only (cleaned)
[[ -f /usr/share/fzf/shell/key-bindings.zsh ]] && source /usr/share/fzf/shell/key-bindings.zsh

# ============================================================
#                    FZF HISTORY WIDGETS
# ============================================================
fzf-history-widget() {
    BUFFER=$(fc -l 1 | awk '{ $1=""; print substr($0,2) }' \
        | fzf --no-sort --reverse --prompt=" history ❯ " \
              --preview-window=down,3,wrap)
    CURSOR=$#BUFFER
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget

fzf-history-clean() {
    BUFFER=$(history | awk '{ $1=""; print substr($0,2) }' \
        | awk '!seen[$0]++' \
        | fzf --prompt=" clean hist ❯ ")
    CURSOR=$#BUFFER
}
zle -N fzf-history-clean
bindkey '^S' fzf-history-clean

fzf-grep-history() {
    BUFFER=$(history | awk '{ $1=""; print substr($0,2) }' \
        | fzf --prompt=" history grep ❯ " --preview="printf %s {}")
    CURSOR=$#BUFFER
}
zle -N fzf-grep-history
bindkey '^[h' fzf-grep-history

# ============================================================
#                     FZF FILE BROWSER (CTRL-B)
# ============================================================
fzf-file-browser() {
    local selected
    selected=$(fd --type f --type d --hidden --follow --exclude .git . \
        | fzf --prompt="📁 browse ❯ " \
              --layout=reverse \
              --height=90% \
              --border \
              --preview '([[ -d {} ]] && ls -a --color=always {} || bat --color=always --style=numbers {} 2>/dev/null)' \
              --preview-window=right:60%)

    [[ -z "$selected" ]] && return

    if [[ -d "$selected" ]]; then
        cd "$selected"
    else
        eval "$EDITOR \"$selected\""
    fi
    zle reset-prompt
    zle redisplay

}   
zle -N fzf-file-browser
bindkey '^B' fzf-file-browser

# ============================================================
#                  CAPS LOCK HOOK (UNCHANGED)
# ============================================================
_last_cmd=""
my_preexec_hook() { _last_cmd="$1"; }

_print_bar() {
    local cols=$(tput cols 2>/dev/null || echo 80)
    printf '=%.0s' $(seq 1 "$cols")
    echo
}

my_precmd_hook() {
    local _st=$?
    local cmd="$_last_cmd"

    [[ $_st -eq 130 ]] && return

    if [[ $_st -ne 0 && "$cmd" != "${cmd:l}" ]]; then
        local COLOR_RESET=$(tput sgr0)
        local COLOR_YELLOW=$(tput setaf 3)
        local COLOR_RED=$(tput setaf 1)
        local BOLD=$(tput bold)

        _print_bar
        echo -e "${BOLD}     (\\_/)"
        echo -e "${BOLD}    =( ಠ益ಠ)="
        echo -e "${BOLD}     ( ง\\¥/)ง"
        _print_bar

        echo -n "${COLOR_YELLOW}${BOLD}OOPS, CAPS LOCK? ${COLOR_RESET}"
        read reply

        if [[ "$reply" != [Nn] ]]; then
            typeset -l lower_cmd="$cmd"
            echo "${COLOR_YELLOW}${BOLD}Well, better luck next time!${COLOR_RESET}"
            _print_bar
            echo "${COLOR_RED}> $lower_cmd${COLOR_RESET}"
            eval "$lower_cmd"
        fi
    fi
}

add-zsh-hook preexec my_preexec_hook
add-zsh-hook precmd my_precmd_hook
#############################################################
#        FORÇAR CURSOR EM BLOCO — VERSÃO DEFINITIVA
#############################################################

# ESC [ 2 q  = steady block (o mais aceito por terminals modernos)

force_cursor_block() {
  printf '\e[1 q'
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd force_cursor_block

zle-line-init() {
  printf '\e[1 q'
  zle reset-prompt 2>/dev/null || true
}
zle -N zle-line-init

zle-line-finish() {
  printf '\e[1 q'
}
zle -N zle-line-finish

printf '\e[1 q'
