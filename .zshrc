# source ~/.cache/wal/colors.sh
# (cat ~/.cache/wal/sequences &)

# =========================
# BASIC ZSH SETUP
# =========================
export ZDOTDIR="$HOME"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

setopt autocd
setopt correct
setopt extendedglob
setopt nobeep
setopt hist_ignore_dups
setopt share_history

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# =========================
# KEYBINDINGS (IMPORTANT)
# =========================

# Backspace should delete ONE character
bindkey '^?' backward-delete-char   # DEL
bindkey '^H' backward-delete-char   # BS

# Word deletion (standard)
bindkey '^W' backward-kill-word     # Ctrl+W
bindkey '^[^?' backward-kill-word   # Alt+Backspace# Ctrl + Arrow word movement
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Better history search
bindkey '^R' history-incremental-search-backward

# =========================
# COMPLETION
# =========================
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}



# =========================
# Autosuggestions
# =========================
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Faster + subtle autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555555'


# =========================
# Autosuggestions
# =========================
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Faster + subtle autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555555'


# # =========================
# # PYWAL COLORS
# # =========================
# if [[ -f ~/.cache/wal/colors.sh ]]; then
#   source ~/.cache/wal/colors.sh
# fi

# =========================
# STARSHIP PROMPT
# =========================
eval "$(starship init zsh)"

# =========================
# MODERN CLI ALIASES
# =========================

# safer defaults
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# modern replacements
alias ls='eza --icons --group-directories-first'
alias ll='eza -l --icons --git'
alias la='eza -la --icons --git'
alias tree='eza --tree --icons'

alias cat='bat'
alias nano='nvim'
alias grep='rg'
alias find='fd'
alias du='dust'
alias df='duf'
alias top='btop'
alias ps='procs'

# git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'

# neovim
alias v='nvim'
alias vim='nvim'

# arch helpers
alias pac='sudo pacman'
alias paci='sudo pacman -S'
alias pacr='sudo pacman -Rns'
alias pacu='sudo pacman -Syu'
alias yayu='yay -Syu'

# hyprland
alias hypr-reload='hyprctl reload'
alias hypr-logs='journalctl --user -u hyprland -f'

# misc
alias cls='clear'
alias mkdir='mkdir -pv'

#WM
alias chadwm='startx ~/.config/chadwm/scripts/run.sh'

# =========================
# ENVIRONMENT PATHS
# =========================
export PATH="$HOME/.local/bin:$PATH"

# =========================
# BETTER MAN COLORS
# =========================
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'
export LESS_TERMCAP_ue=$'\e[0m'

# =========================
# START TMUX (OPTIONAL)
# =========================
# Uncomment if you want auto-tmux
# if [[ -z "$TMUX" ]] && [[ "$TERM" != "linux" ]]; then
#   tmux attach || tmux new
# fi

PROMPT='%F{green}[%n@%m]%f %F{yellow}%~%f %# '
# ~/.zshrc

# eval "$(starship init zsh)"
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats 'git:(%b)'
zstyle ':vcs_info:*' enable git

PROMPT='%F{green}[ %n@%m ]%f  %F{yellow}%1~%f  %F{red}${vcs_info_msg_0_}%f
❯ '
#
# sleep 0.2
# tmux


