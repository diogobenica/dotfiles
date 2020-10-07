PROMPT='
$fg[cyan]%n%B@%b$fg[cyan]%m:$fg[red]%B%~ $fg[grey]$(rvm_prompt_info)$(git_prompt_info)$fg[grey]] $fg[grey]%B[%*]%b$reset_color
 $ '

postcmd() { print "" }

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX=" $fg[yellow]%B("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%b"
ZSH_THEME_GIT_PROMPT_CLEAN="✔"
ZSH_THEME_GIT_PROMPT_DIRTY="✗"
