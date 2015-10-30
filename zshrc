# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export HOME=~
export PATH=$PATH:$HOME/local/bin

#export PATH=$PATH:$HOME/work/scala-2.9.2/bin
#export SCALA_HOME=$HOME/work/scala-2.9.2

export ORACLE_HOME=${HOME}/opt/oracle
export PATH=${ORACLE_HOME}/bin:$PATH
export DYLD_LIBRARY_PATH=${ORACLE_HOME}/lib

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

export PATH=/Users/kunou/work/android-sdk-macosx/platform-tools:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

## bundle open on RubyMine
export BUNDLER_EDITOR=mine

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home/jre"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

## lein
export PATH=$HOME/bin:$PATH
export FPATH=/usr/local/share/zsh/site-functions/_lein:$FPATH

## ruby
export BUNDLER_EDITOR='vim'

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@" &'

## git commands alias
alias gd='git diff'
alias gds='git diff --staged'
alias ga='git add .'
alias gc='git commit -m'
alias gac='git add .; git commit -m'
alias gl='git log'
alias gpush='git push -u'
alias gpull='git pull --prune'
alias gbranchs='(for i in `git branch | colrm 1 2` ; do echo `git log --date=iso8601 -n 1 --pretty="format:[%ai] %h" $i` $i ; done) | sort -r'

## bundle commands alias
alias be='bundle exec'
alias berc='bundle exec rails console'
alias bers='bundle exec rails server'
alias berr='bundle exec rails run'
