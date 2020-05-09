PROMPT=$'\
%D{[%H:%M:%S]}$(virtualenv_prompt_info)$(git_prompt_info)
%{$fg_bold[white]%}%n@%m:%~%(?.%{$fg[white]%}.%{$fg[red]%})$%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[white]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_VIRTUALENV_PREFIX=" %{$fg_bold[white]%}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
