## Aliases ##
# Shortcuts #
alias @='cd ~/@'
alias temp='cd ~/@/temp'
alias d="cd ~/Desktop"
alias ts='cd ~/@/talkingstick'
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

# Helpers #
alias o='open .'
alias ip='ipconfig getifaddr en0 | (tr -d "\n" | pbcopy); ipconfig getifaddr en0; echo "Coppied to clipboard"'
alias cl="clear && printf '\e[3J'"

## Custom Prompt ##
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}
export PS1="\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \w \[\033[31m\]✝\[\033[00m\] "

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
