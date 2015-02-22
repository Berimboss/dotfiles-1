fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

export PATH="/usr/local/bin/:/opt/chef/embedded/bin:/opt/chef/bin:$PATH"

export LC_ALL=ja_JP.UTF-8

autoload -Uz add-zsh-hook
autoload -U compinit
compinit -u

autoload -U colors; colors
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

alias reload="source ~/.zshrc"
alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc"
alias mxmlc="mxmlc -library-path ~/Starling-Framework/starling/bin/starling.swc ~/flex_sdk_4.6/frameworks/libs/* -static-link-runtime-shared-libraries=true -swf-version=17"
alias ll="ls -l"

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats ' %b '
zstyle ':vcs_info:*' actionformats ' %b|%a '

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}


function git-current-branch {
    local name st color
    
    if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
        return
    fi
    name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
    if [[ -z $name ]]; then
        return
    fi
    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
        color=${fg[green]}
    elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
        color=${fg[yellow]}
    elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
        color=${fg_bold[red]}
    else
        color=${fg[blue]}
    fi

    echo "%{$color%}$name%{$reset_color%}"
}

setopt prompt_subst
PROMPT='[%~ `git-current-branch`]# '
RPROMPT='[%n@%m]'

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

