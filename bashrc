platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='osx'
fi

function exitstatus {

    EXITSTATUS="$?"
    BOLD="\[\033[1m\]"
    RED="\[\033[1;31m\]"
    GREEN="\[\e[32;1m\]"
    BLUE="\[\e[34;1m\]"
    OFF="\[\033[m\]"
    PROMPT="[($CONDA_DEFAULT_ENV) \u@\h \w\n\[$(tput sgr0)\]"

    if [ "${EXITSTATUS}" -eq 0 ]
    then
       PS1="${PROMPT} ${BOLD}${GREEN}:)${OFF} ]\$ "
    else
       PS1="${PROMPT} ${BOLD}${RED}:(${OFF} ]\$ "
    fi

    PS2="${BOLD}>${OFF} "

}

PROMPT_COMMAND=exitstatus
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# VI mode
set -o vi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kypak/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kypak/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kypak/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kypak/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

