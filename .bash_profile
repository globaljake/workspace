## Aliases and Functions ##
# Shortcuts #
alias d='cd ~/Desktop';
alias @='cd ~/@';
alias me='cd ~/@/me';
alias temp='cd ~/@/temp';
alias tsi='cd ~/@/tsi';
alias alcon='cd $AL_SERVERS';
alias al='cd $AL_HOME';
alias bp='atom ~/.bash_profile';
alias refresh='source ~/.bash_profile';
alias 1='cd $RECALL_PATH';

# Git #
alias gas='git add . && git status';
alias gcm='git commit -m ';
alias gpr='git pull --rebase';
alias gpo='git push origin';
alias gs='git status';
alias gc='git commit';
alias gst='git stash save';
alias gstp='git stash pop';
alias git-clean='git clean -d -f -i && git reset --hard';
alias git-undo-last-commit='git reset --soft HEAD~1';

# node / npm #
alias nr='npm run ';
alias ns='npm start';

# Helpers #
alias cd..='cd ..';
alias ..='cd ..';
alias o='open .';
alias a='atom .';
alias cl='clear && printf "\e[3J"';
alias rmrf='rm -rf';
alias copy='tr -d "\n" | pbcopy'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e';
alias ip=myip;
#alias dns-flush-cache=sudo dscacheutil -flushcache;
function myip {
  echo IP \(Private\): $(ipconfig getifaddr en0);
  echo IP \(Public\): $(curl -s http://ipecho.net/plain; echo);
}

function mcd {
  if [ -z "$1" ]; then
    echo 'No name provided';
    echo 'Ex. mcd myNewDirectory';
  else
    mkdir -p $1;
    cd $1;
  fi
}

function atom-save-package-list {
  if [ -z "$1" ]; then
    echo 'No output file provided.';
    echo 'Ex. save-atom-package-list atom-package-list.txt';
  else
    apm list --installed --bare > $1;
    echo Atom package list saved to $1;
  fi
}
onall () {
  # http://stackoverflow.com/a/27515672
    if [[ $1 == "--help" ]]; then
        echo "Usage: onall <command>"
        return 0
    fi
    osascript -e "tell application \"Terminal\"
        repeat with w in windows
            repeat with t in tabs of w
                do script \"${1//\"/\\\"}\" in t
            end repeat
        end repeat
    end tell" >/dev/null
}

function atom-install-package-list {
  if [ -z "$1" ]; then
    echo 'No file provided for install.';
    echo 'Ex. install-atom-package-list atom-package-list.txt';
  else
    apm install --packages-file $1;
  fi
}

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f "$1" ] ; then
        local nameInLowerCase=`echo "$1" | awk '{print tolower($0)}'`
        case "$nameInLowerCase" in
          *.tar.bz2)   tar xvjf ./"$1"    ;;
          *.tar.gz)    tar xvzf ./"$1"    ;;
          *.tar.xz)    tar xvJf ./"$1"    ;;
          *.lzma)      unlzma ./"$1"      ;;
          *.bz2)       bunzip2 ./"$1"     ;;
          *.rar)       unrar x -ad ./"$1" ;;
          *.gz)        gunzip ./"$1"      ;;
          *.tar)       tar xvf ./"$1"     ;;
          *.tbz2)      tar xvjf ./"$1"    ;;
          *.tgz)       tar xvzf ./"$1"    ;;
          *.zip)       unzip ./"$1"       ;;
          *.Z)         uncompress ./"$1"  ;;
          *.7z)        7z x ./"$1"        ;;
          *.xz)        unxz ./"$1"        ;;
          *.exe)       cabextract ./"$1"  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "'$1' - file does not exist"
    fi
fi
}

## Custom Prompt ##
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/';
}
export PS1="\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \w \[\033[34m\]=>\[\033[00m\] "

## Auto Completion ##
# Git #
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash;
fi

# Homebrew #
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion;
fi

## Environmental Variables ##
# Android Development #
export ANDROID_HOME=/Users/jakequattrocchi/Library/Android/sdk;
export ANDROID_NDK=~/Library/Android/ndk;

# PATH #
# TODO: organize PATH variable
PATH=/usr/local/bin:/usr/local/tfs:$PATH;
export PATH=${PATH}:/Users/jakequattrocchi/Library/Android/sdk/platform-tools:/Users/jakequattrocchi/Library/Android/sdk/tools
export PATH="/usr/local/sbin:$PATH"

export WMSJAVA_HOME="/Library/WowzaStreamingEngine-4.6.0/java"

export AL_HOME=~/@/tsi/projects/asklive
export AL_SERVERS=~/@/tsi/common/connect/asklive

function recall {
  sed -i '' -e '$ d' ~/.bash_profile;
  echo "export RECALL_PATH=$(pwd);" >> ~/.bash_profile;
  onall refresh;
}
## DONT WRITE BELOW THIS POINT
export RECALL_PATH=/Users/jakequattrocchi/@/tsi/projects/asklive/fblive;
