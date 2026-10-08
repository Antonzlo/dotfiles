# PATH (typeset -U drops duplicates)
typeset -U path
path=(~/.local/bin ~/bin ~/.cargo/bin ~/.lmstudio/bin $path)
[[ -f ~/android-dev/env.sh ]] && source ~/android-dev/env.sh

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history hist_ignore_all_dups hist_ignore_space hist_reduce_blanks extended_history

# Behaviour
setopt auto_cd auto_pushd pushd_ignore_dups interactive_comments no_beep
bindkey -e
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Completion
autoload -Uz compinit && compinit -d ~/.cache/zcompdump
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Prompt: dir, git branch, red on non-zero exit
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats ' %F{magenta}%b%f'
precmd() { vcs_info }
setopt prompt_subst
PROMPT='%F{blue}%~%f${vcs_info_msg_0_} %(?.%F{green}.%F{red})❯%f '

# Aliases
alias ls='ls --color=auto' ll='ls -lah' la='ls -A'
alias grep='grep --color=auto'
alias ..='cd ..' ...='cd ../..'
alias g=git gs='git status -sb' gd='git diff' gl='git log --oneline --graph -20'
(( $+commands[bat] )) && alias cat='bat --paging=never'

# Tools (each optional)
(( $+commands[mise] )) && eval "$(mise activate zsh)"
(( $+commands[fnm] )) && eval "$(fnm env --use-on-cd --shell zsh)"
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"
(( $+commands[fzf] )) && source <(fzf --zsh)

# Machine-local overrides, not tracked
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Plugins (Fedora packages). syntax-highlighting must be last.
for p in /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
         /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; do
  [[ -f $p ]] && source $p
done
