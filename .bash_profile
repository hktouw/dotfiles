# ~/.bashrc: usually executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# *note* Not the case for Mac OSX, which executes ~/.bash_profile for non-login
# shells instead of ~/.bashrc. Therefore ~/.bashrc should be called from
# ~/.bash_profile
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Place login-specfic bash stuff below


################################################################################
# Personal Bash Configuration Tweaks                                           #
################################################################################

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


################################################################################
# Customize the bash prompt                                                    #
################################################################################
prompt_command () {
    BLACK=$(tput setaf 0)
    WHITE=$(tput setaf 15)
    NORMAL=$(tput sgr0)
    GREEN=$(tput setaf 2)

    if [ $? -eq 0 ]; then # set an error string for the prompt, if applicable
        ERRPROMPT=" "
    else
        ERRPROMPT='-&gt;($?) '
    fi
    
    if [ `date +%p` = "PM" ]; then
        meridiem="pm"
    else
        meridiem="am"
    fi

    local gitbranch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\* \1 /'`

    local TIME=`date +"%l:%M:%S$meridiem"|sed 's/ //g'`
    local myprompt="\[${NORMAL}\]_________________________________________________________\n"
    myprompt=$myprompt"[\u@\h ${TIME}]$ERRPROMPT \w\n"
    myprompt=$myprompt"\[${GREEN}\]${gitbranch}\[${NORMAL}\]$ \[${NORMAL}\]"

    export PS1=$myprompt
}
PROMPT_COMMAND=prompt_command
 
#print your terminal's ANSI colors for codes 0-256
print_colors () {
    ( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done; )
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting




export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:$HOME/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias ls='ls -GF'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias say='say -v kyoko'
alias repos='cd /Users/hktouw/Repos'
alias notes='cd /Users/hktouw/Dropbox/notes'
alias gnotes='cd /Users/hktouw/Dropbox/notes/github'
alias gsnotes='cd /Users/hktouw/Dropbox/notes/greatschools'
alias s228='cd /Users/hktouw/Repos/cs228'
alias haskell='cd /Users/hktouw/Repos/haskell'
alias gg='cd /Users/hktouw/github/github'
alias gs='cd /Users/hktouw/github/spamurai'
alias gsh='cd /Users/hktouw/github/spamuraigh'
alias ham='cd /Users/hktouw/github/hamzo'
alias olg='cd /Users/hktouw/go/src/github.com/github/octocaptcha-logger'
alias fe='cd /Users/hktouw/github/flink-experiments'
alias ge='cd /Users/hktouw/github/enterprise2'
alias gh-presto="presto --server presto-coordinator.service.github.net:8080"
alias gh-presto-export="gh-presto --output-format CSV_HEADER -f"

alias ctags="`brew --prefix`/bin/ctags"


alias ls='ls -G'                  # remap ls with colors
alias lh='ls -cd .*'              # Hidden files only.
alias ll='ls -lh'                 # Long list.
alias la='ls -ca'                 # List everything.
alias ld='ls -cd */'              # Directories only.
alias lda='ls -cda */'            # Directories only (including hidden ones).
alias ldh='ls -cda .*/'           # Hidden directories only.
alias lf='ls -p | grep -v "/$"'   # Files only.
alias lfa='ls -ap | grep -v "/$"' # Files only (including hidden ones).

alias grep='grep --color=auto'
alias gi='grep -i'
alias gv='grep -v'                    # Exclusive grep.
alias gvi='grep -vi'                  # Exclusive grep sans case-sensitivity.


railsdoc() { open dash://rails:"$1"; }
backbonedoc() { open dash://backbone:"$1"; }
rubydoc() { open dash://ruby:"$1"; }
bootstrapdoc() { open dash://bootstrap:"$1"; }
jquerydoc() { open dash://jquery:"$1"; }
markdowndoc() { open dash://markdown:"$1"; }
rubygemsdoc() { open dash://rubygems:"$1"; }
vimdoc() { open dash://vim:"$1"; }
psqldoc() { open dash://psql:"$1"; }
mysqldoc() { open dash://mysql:"$1"; }
htmldoc() { open dash://html:"$1"; }
jqueryuidoc() { open dash://jqueryui:"$1"; }
cssdoc() { open dash://css:"$1"; }
javascriptdoc() { open dash://javascript:"$1"; }


export FZF_DEFAULT_COMMAND='fd --type f'

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

# To apply the command to CTRL-T as well
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_COMMAND="fd --type f"

alias ghgo='git config --get remote.origin.url | ruby -ne "puts %{https://github.com/#{\$_.split(/.com[\:\/]/)[-1].gsub(%{.git},%{})}}" | xargs open'

# to fix sed: RE error: illegal byte sequence
# export LC_CTYPE=C
# export LANG=C
#
eval "$(rbenv init -)"
eval "$(nodenv init -)"

export EDITOR=/usr/local/bin/vim

# added by Anaconda3 4.2.0 installer
# export PATH="//anaconda/bin:$PATH"

# persist history for iex repl
export ERL_AFLAGS="-kernel shell_history enabled"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export GOPATH="/Users/hktouw/go"
export PATH=$PATH:$GOPATH/bin
