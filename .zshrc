# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
setopt COMPLETE_IN_WORD

# Zoxide
eval "$(zoxide init zsh)"

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Prompt with git branch
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PS1='%F{green}%n@%m%f %F{blue}%1~%f%F{yellow}${vcs_info_msg_0_}%f %# '

# Environment variables
export EDITOR="nvim"
export VISUAL="nvim"
export NPM_SIS_REGISTRY="https://infinitecampus.jfrog.io/artifactory/api/npm/npm-snapshot-virtual"
export NPM_SIS_TOKEN="lol u thought"
export ORG_GRADLE_PROJECT_artifactory_user="daniel.turnquist"
export ORG_GRADLE_PROJECT_artifactory_password="lol u thought"
export GRADLE_OPTS="-Dgradle.wrapperUser=$ORG_GRADLE_PROJECT_artifactory_user -Dgradle.wrapperPassword=$ORG_GRADLE_PROJECT_artifactory_password"

# Cargo 
export PATH="$HOME/.cargo/bin:$PATH"
