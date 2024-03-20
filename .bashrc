#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(thefuck --alias)"

###########################
# General purpose aliases #
###########################

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias mediassh='ssh -p 49101 sam@samig.damustr8babygurl.com'
alias speed='speedtest --secure'

PS1='\w] >> '
PS2='>>> '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sam/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sam/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sam/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sam/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/bin:$HOME/.local/share/applications:$PATH"

# Function to open a terminal app but close the terminal window
openclose() {
    "$@" &
    disown
    exit
}

############################
# Pomodoro function in CLI #
############################

declare -A pomo_options
pomo_options["work"]="25"
pomo_options["break"]="5"
pomo_options["long break"]="15"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  spd-say "'$val' session done"
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"
alias lb="pomodoro 'long break'"

############################
# End of pomodoro function #
############################

eval "$(zoxide init bash)"

