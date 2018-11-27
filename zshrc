# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export PATH=$PATH:/usr/local/bin

export HOME=~
export PATH=$PATH:$HOME/.local/bin

#export PATH=$PATH:$HOME/work/scala-2.9.2/bin
#export SCALA_HOME=$HOME/work/scala-2.9.2

export ORACLE_HOME=${HOME}/opt/oracle
export PATH=${ORACLE_HOME}/bin:$PATH
export DYLD_LIBRARY_PATH=${ORACLE_HOME}/lib

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

export PATH=/Users/kunou/work/android-sdk-macosx/platform-tools:$PATH
export PATH=/Users/kunou/Library/Android/sdk/ndk-bundle:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="/usr/local/Cellar/node/9.11.1/bin:$PATH"
## bundle open on RubyMine
export BUNDLER_EDITOR=mine

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home/jre"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## fastboot
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH

## lein
export PATH=$HOME/bin:$PATH
export FPATH=/usr/local/share/zsh/site-functions/_lein:$FPATH

## ruby
export BUNDLER_EDITOR='vim'

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /usr/local/Cellar/macvim/8.0-145_2/bin/mvim -v "$@"'
alias vim='env LANG=ja_JP.UTF-8 /usr/local/Cellar/macvim/8.0-145_2/bin/mvim -v "$@"'
alias mvim='env LANG=ja_JP.UTF-8 /usr/local/Cellar/macvim/8.0-145_2/bin/mvim -v "$@" &'

## git
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

### git alias
alias gd='git diff'
alias gds='git diff --staged'
alias ga='git add .'
alias gc='git commit -m'
alias gac='git add .; git commit -m'
alias gl='git log --oneline'
alias gpush='git push -u'
alias gpull='git pull --prune'
alias gco='git checkout'
alias gri='git add .; git commit -m wip; git rebase -i head~$1'
alias gri2='git add .; git commit -m wip; git rebase -i head~2'

alias gbranches='(for i in `git for-each-ref --sort='-committerdate' --format="%(refname:short)" refs/heads/` ; do echo $i@@`git log --date=iso8601 -n 1 --pretty="format:%ai@@%h@@%an@@%s" $i` ; done) | ruby -e "
  branches = STDIN.read.split("\n").map {|line| line.split %(@@) }.map {|branch_name, last_updated_at, hash, auther, log|
     {branch_name: branch_name, last_updated_at: last_updated_at, hash: hash, auther: auther, log: log}
  }

  def blue(str, i)
    if i.even?
      %(\e[44m#{str}\e[0m)
    else
      %(\e[48;5;68m#{str}\e[0m)
    end
  end
  
  def normal(str, i)
    if i.even?
      %(\e[40m#{str}\e[0m)
    else
      %(\e[48;5;238m#{str}\e[0m)
    end
  end

  branches.each_with_index do |branch, i|
    print(normal(sprintf(%(%-35s), branch[:branch_name]), i))
    print(blue(sprintf(%(%-26s), branch[:last_updated_at]), i))
    print(normal(sprintf(%(%-12s), branch[:hash]), i))
    print(blue(sprintf(%(%-20s), branch[:auther]), i))
    print(normal(sprintf(%(%-40s), branch[:log])[0...40], i))
    puts
  end
"'

alias rmoldbranch='(for i in `git for-each-ref --sort=-committerdate --format="%(refname:short)" refs/heads/` ; do echo $i ; done) | tail -n 10 | xargs git branch -D'

## bundle commands alias
alias be='bundle exec'
alias berc='bundle exec rails console'
alias bers='bundle exec rails server'
alias berr='bundle exec rails run'
alias bi='bundle install'

alias ptest="RAILS_ENV=test be parallel_test spec --type rspec -n 2 --suffix '_spec.rb|.feature'"
alias pmigrate_reset="bundle exec parallel_test --exec 'rake db:migrate:reset RAILS_ENV=test' -n 2"
alias pmigrate="bundle exec parallel_test --exec 'rake db:migrate RAILS_ENV=test' -n 2"

export PATH="$HOME/.exenv/bin:$PATH"
PATH=$HOME/.exenv/versions/1.3.3/bin:$PATH

# added by travis gem
[ -f /Users/kunou/.travis/travis.sh ] && source /Users/kunou/.travis/travis.sh

# for docker
# export DOCKER_CERT_PATH=/Users/kunou/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1
# export DOCKER_HOST=tcp://192.168.59.103:2376
 
export BUNDLER_EDITOR=mine

alias tmux='tmux -u'

# for Python
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/versions/3.6.3/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# for Haskell
export PATH=${HOME}/.local/bin:$PATH

# for TreeTager
export PATH=${HOME}/work/tree_tagger/cmd:${HOME}/work/tree_tagger/bin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/kunou/.sdkman"
[[ -s "/Users/kunou/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/kunou/.sdkman/bin/sdkman-init.sh"

export GOOGLE_APPLICATION_CREDENTIALS='/Users/kunou/Downloads/kunou-test-7d5b9c39b1de.json'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kunou/work/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/kunou/work/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kunou/work/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/kunou/work/google-cloud-sdk/completion.zsh.inc'; fi
