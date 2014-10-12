fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

export PATH="/opt/chef/embedded/bin:/opt/chef/bin:$PATH"

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

add-zsh-hook precmd _update_vcs_info_msg
PROMPT='[%~%1(v|%F{green}%1v%f|)]# '
RPROMPT='[%n@%m]'

