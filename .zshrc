# .zshrc is read each time an interactive shell starts. Suitable for:
# - command completion, correction, suggestion, history management 
# - prompt settings, colors, highlighting
# - aliases and keybindings
# - miscellaneous tools

# Powerlevel10k theme instant prompt. Keep close to top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize, run `p10k configure` or edit file directly.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

# zsh, homebrew, node
ZSH=$HOME/.oh-my-zsh
plugins=(git brew zsh-nvm)
source $ZSH/oh-my-zsh.sh
export HISTFILE=$ZSH/custom/history

# environment
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
export LANG=en_US.UTF-8
export EDITOR=vim

# dotfile management
alias zshconfig="$EDITOR ~/.zshrc"
alias zprofile="$EDITOR ~/.zprofile"
alias ohmyzsh="$EDITOR $ZSH"
alias reload='exec zsh --login'

# datetime
alias date1='date +%H:%M\ %A\ %-d\ %B\ %Y'
alias date2='date +%a\ %-d\/%-m\ %H:%M'
alias date3="date $DATEFMT"

# safety
alias rm='echo do not use rm. Use del instead. # '
DATEFMT="+%a%d%b%T"
DELDIR=$HOME/.Trash
function del { for var in "$@"; do
    mv -f $var $DELDIR/${var}@$(date $DATEFMT); done }
DELLDIR=$HOME/.trashlater
function dell { mkdir -p $DELLDIR; for var in "$@"; do
    mv -f $var ${DELLDIR}/${var}@$(date $DATEFMT); done }

# convenience 
alias gs='git status'
alias -g G='| grep'
alias pathl='echo $PATH | tr ":" "\n"'
alias hmm="history | grep "
alias server='python3 -m http.server'

# productivity
function mkcd { mkdir $1 && cd $1 }
function copy { echo -n `cat $1` | pbcopy }
alias gihub='git init && hub create -p'
alias gihubpub='git init && hub create'
function mkgihub() { mkdir $1 && cd $1 && git init && hub create -p }
function mkgihubpub() { mkdir $1 && cd $1 && git init && hub create }

# utility
alias timezsh='for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done'
alias clearh='history -p'
alias myiplocal='ipconfig getifaddr en0'
alias myipglobal='curl -s ipecho.net/plain;echo'
alias myip='myiplocal;myipglobal'

# functions
fpath+=$ZSH/custom/functions
autoload -Uz colors && colors
autoload penv shrink

# rust
export PATH=~/.cargo/bin:$PATH # Rust

# sdk  THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

