if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%m:%3~$(git_info_for_prompt)%# '
else
  export PS1='%3~$(git_info_for_prompt)%# '
fi

export LSCOLORS="GxFxcxdxBxegedabagacad"
export LS_COLORS="di=1;36:ln=1;35:so=32:pi=33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export CLICOLOR=true

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

zle -N newtab

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char

# exports colors to be used in other bash scripts
# use by sourcing then
# printf "${cc_red} text ${cc_NC}"

cc_NC='\033[0m'

# Regular Colors
cc_black='\033[0;30m'            # Black
cc_red='\033[0;31m'              # Red
cc_green='\033[0;32m'            # Green
cc_yellow='\033[0;33m'           # Yellow
cc_blue='\033[0;34m'             # Blue
cc_purple='\033[0;35m'           # Purple
cc_cyan='\033[0;36m'             # Cyan
cc_white='\033[0;37m'            # White

# High Intensity
cc_hh_black='\033[0;90m'         # Black
cc_hh_red='\033[0;91m'           # Red
cc_hh_green='\033[0;92m'         # Green
cc_hh_yellow='\033[0;93m'        # Yellow
cc_hh_blue='\033[0;94m'          # Blue
cc_hh_purple='\033[0;95m'        # Purple
cc_hh_cyan='\033[0;96m'          # Cyan
cc_hh_white='\033[0;97m'         # White

# BOLD Regular Colors
cc_black_bold='\033[1;30m'       # Black
cc_red_bold='\033[1;31m'         # Red
cc_green_bold='\033[1;32m'       # Green
cc_yellow_bold='\033[1;33m'      # Yellow
cc_blue_bold='\033[1;34m'        # Blue
cc_purple_bold='\033[1;35m'      # Purple
cc_cyan_bold='\033[1;36m'        # Cyan
cc_white_bold='\033[1;37m'       # White

# BOLD High Intensity
cc_hh_black_bold='\033[1;90m'    # Black
cc_hh_red_bold='\033[1;91m'      # Red
cc_hh_green_bold='\033[1;92m'    # Green
cc_hh_yellow_bold='\033[1;93m'   # Yellow
cc_hh_blue_bold='\033[1;94m'     # Blue
cc_hh_purple_bold='\033[1;95m'   # Purple
cc_hh_cyan_bold='\033[1;96m'     # Cyan
cc_hh_white_bold='\033[1;97m'    # White

#Replace any leading leading 0; with 1; for bold colors
#Replace any leading 0; with 4; to underline