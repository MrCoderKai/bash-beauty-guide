alias ll='ls -alhG'
alias ls='ls -G'
alias grep='grep -G'
alias fgrep='fgrep -G'
alias egrep='egrep -G'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vi='vim'
# set default editor for command `crontab -e`, if not, error accurs
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
# export EDITOR=vim
alias goal='ssh chengkai@39.107.75.198'
alias goalr='ssh root@39.107.75.198'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# alias ctags if you used homebrew
alias ctags="`brew --prefix`/bin/ctags"

export SHELL=/bin/zsh
exec /bin/zsh -l
