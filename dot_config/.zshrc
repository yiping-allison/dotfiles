# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
# Init Linuxbrew, which adds environment variables
# ! NOTE: We need to do it beforehand to add `just` completions
eval export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
fpath[1,0]="/home/linuxbrew/.linuxbrew/share/zsh/site-functions";
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# aliases
alias gl='git log --graph --pretty=format:"%C(yellow)%H%Creset%nAuthor: %C(bold blue)%an <%ae>%Creset%nDate:   %C(green)%ad%Creset%n%n    %s%n" --date=iso'
alias gs='git status'
alias gap='git add -p'
alias ga='git add .'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gb='git branch'
alias pn=pnpm
# aliases end

# oh my posh
eval "$(oh-my-posh init --config $HOME/.config/oh-my-posh/catppuccin.omp.json zsh)"
# oh my posh end

# local bin
export PATH=$HOME/.local/bin:$PATH
# local bin end

# go
export PATH=$PATH:/usr/local/go/bin
# go end

# java
export JAVA_HOME="/usr/lib/jvm/jdk-21.0.7+6"
export PATH="$PATH:$JAVA_HOME/bin"
# java end

# pnpm
export PNPM_HOME="/home/allison/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
