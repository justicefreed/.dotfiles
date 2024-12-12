# ~/.bash_profile
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen!

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
fi

export EDITOR="nano"

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Disable completion when the input buffer is empty.  i.e. Hitting tab
# and waiting a long time for bash to expand all of $PATH.
shopt -s no_empty_cmd_completion

# Enable history appending instead of overwriting when exiting.  #139609
shopt -s histappend

# Save each command to the history file as it's executed.  #517342
# This does mean sessions get interleaved when reading later on, but this
# way the history is always up to date.  History is not synced across live
# sessions though; that is what `history -n` does.
# Disabled by default due to concerns related to system recovery when $HOME
# is under duress, or lives somewhere flaky (like NFS).  Constantly syncing
# the history will halt the shell prompt until it's finished.
#PROMPT_COMMAND='history -a'

# Change the window title of X terminals 
case ${TERM} in
        [aEkx]term*|rxvt*|gnome*|konsole*|interix|tmux*)
                PS1='\[\033]0;\u@\h:\w\007\]'
                ;;
        screen*)
                PS1='\[\033_\u@\h:\w\033\\\]'
                ;;
        *)
                unset PS1
                ;;
esac

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.
# We run dircolors directly due to its changes in file syntax and
# terminal name patching.
use_color=false
if type -P dircolors >/dev/null ; then
        # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
        LS_COLORS=
        if [[ -f ~/.dir_colors ]] ; then
                eval "$(dircolors -b ~/.dir_colors)"
        elif [[ -f /etc/DIR_COLORS ]] ; then
                eval "$(dircolors -b /etc/DIR_COLORS)"
        else
                eval "$(dircolors -b)"
        fi
        # Note: We always evaluate the LS_COLORS setting even when it's the
        # default.  If it isn't set, then `ls` will only colorize by default
        # based on file attributes and ignore extensions (even the compiled
        # in defaults of dircolors). #583814
        if [[ -n ${LS_COLORS:+set} ]] ; then
                use_color=true
        else
                # Delete it if it's empty as it's useless in that case.
                unset LS_COLORS
        fi
else
        # Some systems (e.g. BSD & embedded) don't typically come with
        # dircolors so we need to hardcode some terminals in here.
        case ${TERM} in
        [aEkx]term*|rxvt*|gnome*|konsole*|screen|tmux|cons25|*color) use_color=true;;
        esac
fi

_COLORreset='\[\033[0m\]'
_COLORBackgroundDarkGrey='\[\033[100m\]'
_COLORBackgroundDefault='\[\033[49m\]'
_COLORBackgroundYellow='\[\033[43m\]'
_COLORBackgroundLightBlue='\[\033[104m\]'
_COLORBoldWhite='\[\033[1;97m\]'
_COLORDefault='\[\033[39m\]'
_COLORBlack='\[\033[30m\]'
_COLORBlue='\[\033[34m\]'
_COLORBoldBlue='\[\033[1;34m\]'
_COLORLightBlue='\[\033[1;94m\]'
_COLORRed='\[\033[31m\]'
_COLORBoldRed='\[\033[1;31m\]'
_COLORBrightRed='\[\033[91m\]'
_COLORBoldMagenta='\[\033[1;35m\]'
_COLORLightMagenta='\[\033[95m\]'
_COLORYellow='\[\033[33m\]'
_COLORBoldYellow='\[\033[1;33m\]'
_COLORBoldBrightYellow='\[\033[1;93m\]'
_COLORGreen='\[\033[32m\]'
_COLORCyan='\[\033[36m\]'
_COLORLightBlue='\[\033[94m\]'
_COLORLightGrey='\[\033[37m\]'
_COLORDarkGrey='\[\033[90m\]'

function stripslash() {
    return ${1%/}
}

if ${use_color} ; then
    PS1+="${_COLORBoldMagenta}\u${_COLORDarkGrey}@${_COLORLightMagenta}\h ${_COLORBoldYellow}\W/\$ ${_COLORLightBlue}"
    trap 'echo -ne "\033[0m"' DEBUG
    PROMPT_COMMAND="x0=\$?;if ((\$x0 > 0)); then echo '${_COLORRed}# ERROR exit status = '\$x0'$_COLORreset'; fi"

    ## Colorize the ls output ##
    alias ls='ls --color=auto'
    ## Use a long listing format ##
    alias ll='ls -la --color=auto'
    ## Show hidden files ##
    alias l.='ls -d .* --color=auto'

    alias grep='grep --colour=auto'
else
        # show root@ when we don't have colors
        PS1+='\u@\h \w \$ '
fi

if ${use_color} ; then
else
    PS1+='\$  '
fi

# Try to keep environment pollution down, EPA loves us.
unset use_color sh
