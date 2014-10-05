fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

export PATH="/opt/chef/embedded/bin:/opt/chef/bin:$PATH"

export LC_ALL=ja_JP.UTF-8

autoload -U compinit
compinit -u

autoload -U colors; colors
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

alias reload="source ~/.zshrc"
alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc"
alias mxmlc="mxmlc -library-path ~/Starling-Framework/starling/bin/starling.swc ~/flex_sdk_4.6/frameworks/libs/* -static-link-runtime-shared-libraries=true -swf-version=17"
alias ll="ls -l"

function rprompt-git-current-branch {
local name st color gitdir action
if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
	return
fi
name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
if [[ -z $name ]]; then
	return
fi

gitdir=`git rev-parse --git-dir 2> /dev/null`
action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

st=`git status 2> /dev/null`
if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
	color=%F{green}
elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
	color=%F{yellow}
elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
	color=%B%F{red}
else
	color=%F{red}
fi
echo "$color$name$action%f%b "
} 

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

PROMPT='[%~ `rprompt-git-current-branch`]# '
RPROMPT='[%n@%m]'
