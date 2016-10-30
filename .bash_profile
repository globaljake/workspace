## Colors ##
fgblk="$(tput setaf 0)"     # Black - Regular
fgred="$(tput setaf 1)"     # Red
fggrn="$(tput setaf 2)"     # Green
fgylw="$(tput setaf 3)"     # Yellow
fgblu="$(tput setaf 4)"     # Blue
fgpur="$(tput setaf 5)"     # Purple
fgcyn="$(tput setaf 6)"     # Cyan
fgwht="$(tput setaf 7)"     # White

bfgblk="$(tput setaf 8)"    # Black - Bright
bfgred="$(tput setaf 9)"    # Red
bfggrn="$(tput setaf 10)"   # Green
bfgylw="$(tput setaf 11)"   # Yellow
bfgblu="$(tput setaf 12)"   # Blue
bfgpur="$(tput setaf 13)"   # Purple
bfgcyn="$(tput setaf 14)"   # Cyan
bfgwht="$(tput setaf 15)"   # White

bgblk="$(tput setab 0)"     # Black - Background
bgred="$(tput setab 1)"     # Red
bggrn="$(tput setab 2)"     # Green
bgylw="$(tput setab 3)"     # Yellow
bgblu="$(tput setab 4)"     # Blue
bgpur="$(tput setab 5)"     # Purple
bgcyn="$(tput setab 6)"     # Cyan
bgwht="$(tput setab 7)"     # White

bbgblk="$(tput setab 8)"    # Black - Background - Bright
bbgred="$(tput setab 9)"    # Red
bbggrn="$(tput setab 10)"   # Green
bbgylw="$(tput setab 11)"   # Yellow
bbgblu="$(tput setab 12)"   # Blue
bbgpur="$(tput setab 13)"   # Purple
bbgcyn="$(tput setab 14)"   # Cyan
bbgwht="$(tput setab 15)"   # White

normal="$(tput sgr0)"       # text reset
mkbold="$(tput bold)"       # make bold
undrln="$(tput smul)"       # underline
noundr="$(tput rmul)"       # remove underline
mkblnk="$(tput blink)"      # make blink
revers="$(tput rev)"        # reverse

## Aliases and Functions ##
# Shortcuts #
alias d="cd ~/Desktop"
alias @='cd ~/@'
alias me='cd ~/@/me'
alias temp='cd ~/@/temp'
alias tsi='cd ~/@/tsi'
alias al='cd ~/@/tsi/projects/asklive'
alias bp='atom ~/.bash_profile'

# Git #
alias gas='git add . && git status'
alias gcm='git commit -m '
alias gpr='git pull --rebase'
alias gpo='git push origin'
alias gs='git status'
alias gc='git commit'
alias gst='git stash save'
alias gstp='git stash pop'
alias gclean='git clean -d -f -i && git reset --hard'
alias git-undo-last-commit='git reset --soft HEAD~1'

# Helpers #
alias cd..="cd .."
alias ..="cd .."
alias o='open .'
alias cl='clear && printf "\e[3J"'
alias rmrf='rm -rf'
alias copy='tr -d "\n" | pbcopy'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias ip=myip

function myip {
  echo IP \(Private\): $(ipconfig getifaddr en0);
  echo IP \(Public\): $(curl -s http://ipecho.net/plain; echo);
}

function mcd {
  if [ -z "$1" ]; then
    echo 'No name provided';
    echo 'Ex. mcd myNewDirectory';
  else
    mkdir -p $1
    cd $1
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
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

export PS1='${fggrn}$(parse_git_branch)${normal} \w ${fgred}✝${normal} '

## Auto Completion ##
# Git #
source ~/.git-completion.bash

# Homebrew #
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

## Environmental Variables ##
# Android Development #
export ANDROID_HOME=/Users/jakequattrocchi/Library/Android/sdk
export ANDROID_NDK=~/Library/Android/ndk

# PATH #
# TODO: organize PATH variable
PATH="/usr/local/bin:/usr/local/tfs:$PATH"
export PATH=${PATH}:/Users/jakequattrocchi/Library/Android/sdk/platform-tools:/Users/jakequattrocchi/Library/Android/sdk/tools
