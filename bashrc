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

    PROMPT="[\u@\h \w\n\[$(tput sgr0)\]"

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

if [[ $platform == 'linux' ]]; then
    export PATH="/home/kai/anaconda2/bin:$PATH"
elif [[ $platform == 'osx' ]]; then
    export PATH="/Users/kai/anaconda/bin:$PATH"
fi
