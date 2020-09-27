bindkey -v

# History
HISTSIZE=20000
HISTFILES=~/.zsh_history
SAVEHIST=$HISTSIZE

bindkey "^R" history-incremental-search-backward
bindkey "^?" backward-delete-char

# Show contents of directory after cd-ing
chpwd() { ls -lrthG }

# Completion
autoload -U compinit
compinit

# Disable flow control commands
stty start undef
stty stop undef

# Source files
source $HOME/.dotfiles/zsh/aliases
source $HOME/.dotfiles/zsh/functions
source $HOME/.dotfiles/zsh/prompt
source $HOME/.environment_variables

# Add current directory bin
export PATH=$PATH:bin

# Add my own dotfiles bin
export PATH=$PATH:$HOME/.dotfiles/bin

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# RVM
[[ -s "/Users/pradyumna/.rvm/scripts/rvm" ]] && source "/Users/pradyumna/.rvm/scripts/rvm"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/opt/node@12/bin:$PATH"
eval "$(fnm env --multi)"
