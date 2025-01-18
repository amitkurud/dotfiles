#zmodload zsh/zprof


## Path section
# Set $PATH if ~/.local/bin exist
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
ZSH_DISABLE_COMPFIX=true
POWERLEVEL9K_MODE='nerdfont-complete'
unsetopt nomatch

export ZSH="/home/amit/.oh-my-zsh"
export PATH="$HOME/.jenv/bin:$PATH"


export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

# Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expansion with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500
export EDITOR=/usr/bin/vim
#export VISUAL=/usr/bin/nano
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

## Alias section 
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'
alias lla='ll -a'

## Useful aliases
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -avcf '
alias untar='tar -zxvf '
alias imgcat='kitten icat'
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='grep -F --color=auto'
alias egrep='grep -E --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages
alias zvim='zvim() { z $1 && vim};zvim'
alias zv='zvim'

# Get fastest mirrors 
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist" 
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist" 
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist" 
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist" 

# Help people new to Arch
alias apt-get='man pacman'
alias apt='man pacman'
alias helpme='cht.sh --shell'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'
alias please='sudo'
alias tb='nc termbin.com 9999'
alias upd="/usr/bin/update"
alias vim='nvim'
alias vi='nvim'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
alias cat='bat'
# Replace yay with paru if installed
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Use fzf

source <(fzf --zsh)

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
#bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up			
bindkey '^[[B' history-substring-search-down


plugins=(ssh-agent minikube kubectl kubectx  evalcache zsh-autosuggestions zsh-nvm sudo history-substring-search gpg-agent git-extra-commands git systemd git-extras git-auto-fetch git-flow git-prompt taskwarrior git-flow-avh github git-hubflow gitignore copyfile copybuffer mvn mysql-macports nanoc ng scala rvm rust sbt salt safe-paste scd scw vim-interaction virtualenv virtualenvwrapper vscode vundle wakeonlan wd web-search wp-cli ruby docker docker-compose sudo pass ant ansible heroku branch bundler gitfast supervisor archlinux dotenv aws battery emoji emoji-clock encode64 extract jenv jhbuild jruby jsontools branch cabal cake firewalld knife knife_ssh kops pip pipenv pj please postgres pow powder python pyenv rails pylint rake systemd thor fancy-ctrl-z last-working-dir rbenv react-native torrent tmux-cssh transfer rake-fast lein lighthouse gas catimg rbfu rebar cloudfoundry geeknote man repo redis-cli cp dash cpanm gnu-utils golang gulp grunt grails gradle hanami otp spring zeus zsh-navigation-tools yarn nvm  npm per-directory-history nmap sdk zeus rsync ufw urltools repo ros marked2 vagrant vagrant-prompt gem )

source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcache

HISTFILE=~/.zhistory
HISTSIZE=500000
SAVEHIST=100000

export PATH=/home/amit/.local/share/JetBrains/Toolbox/scripts/:$PATH

export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
export JAVA_HOME=/home/amit/.sdkman/candidates/java/current

autoload -Uz compinit
compinit -i
eval "$(zoxide init zsh)"

#eval "$(oh-my-posh init zsh --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json)"
#eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/devious-diamonds.omp.yaml )"
#eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/tokyo.omp.json)"
#eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/if_tea.omp.json)"

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/froczh.omp.json)"
#eval "$(starship init zsh)"
#eval "$(starship init zsh)"

# Load Mcfly
#export MCFLY_FUZZY=true
#export MCFLY_RESULTS=20
#export MCFLY_INTERFACE_VIEW=BOTTOM
#export MCFLY_RESULTS_SORT=LAST_RUN
#eval "$(mcfly init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/amit/.sdkman"
[[ -s "/home/amit/.sdkman/bin/sdkman-init.sh" ]] && source "/home/amit/.sdkman/bin/sdkman-init.sh"
#zprof

# bun completions
[ -s "/home/amit/.bun/_bun" ] && source "/home/amit/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/amit/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/amit/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/amit/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/amit/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/amit/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
