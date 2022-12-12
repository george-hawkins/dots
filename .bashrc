source ~/.bashrc.ostype

# Favor local versions of tools.
PATH=/usr/local/bin:/usr/local/sbin:$PATH

PATH=$HOME/bin:$PATH

PATH=$HOME/.cargo/bin:$PATH

PATH=$HOME/.poetry/bin:$PATH

export EDITOR=vim

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Tell bc to read ~/.bcrc
export BC_ENV_ARGS=$HOME/.bcrc

# Don't put duplicate lines in the history.
export HISTCONTROL=ignoredups

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# `-v` stops dot files being sorted in among other files.
alias ls='ls --color=auto -vF'
alias l='ls -Flash'
alias h='history'

if [[ $- == *i* && -f ~/.bashrc_prompt ]]
then
    source ~/.bashrc_prompt
fi

[ -f ~/.bashrc.local ] && source ~/.bashrc.local

# Make `less` much smarter - with `lesspipe` it can handle tar files, images etc.
[ -x "$(command -v lesspipe)" ] && eval "$(lesspipe)"

# Disable tab-completion expansion of `~` to home path.
# Oddly (without this) `~` expands for some commands, e.g. `unzip`, but not for others, e.g. `ls`.
# This just replaces the same named function found in `.../bash_completion`.
_expand() { true; }
