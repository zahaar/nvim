# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Syntax highlight
source /Users/wparker/Dev/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy

eval "$(pyenv virtualenv-init -)"

alias ll="ls -latrG"

# Shorten the path
alias Ulagen='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Unterlagen/'


# Go Binaries
export PATH="$PATH:$HOME/go/bin"


# Oh My Zsh Config
# AUTOCOMPLETION
# initialize autocompletion
autoload -U compinit && compinit
# history setup
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
# SAVEHIST=1000
# HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
# never beep
setopt NO_BEEP