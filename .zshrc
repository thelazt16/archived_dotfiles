# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

source $HOME/.zplug/init.zsh

#PATH
# source $(dirname $(gem which colorls))/tab_complete.sh
# source ~/.dotbare/dotbare.plugin.zsh
PATH="$HOME/.local/bin:$HOME/bin:$HOME/.bin:$PATH"
#export npm_config_prefix="$HOME/.local"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# TO MAKE YOUR LIFE EASIER -- F#@% CD
setopt autocd
# setopt auto_pushd
# setopt pushd_ignore_dups
# setopt pushdminus

# BIND KEYS
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
#set theme
# zplug romkatv/powerlevel10k, as:theme, depth:1
# zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
# SPACESHIP_BATTERY_SHOW=false
# SPACESHIP_PROMPT_ADD_NEWLINE=false
# SPACESHIP_EXEC_TIME_SHOW=true
# SPACESHIP_EXEC_TIME_PREFIX="took "
# SPACESHIP_EXEC_TIME_SUFFIX=$SPACESHIP_PROMPT_DEFAULT_SUFFIX


# zplug "dracula/zsh", as:theme
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# external Plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "lukechilds/zsh-nvm"
# zplug "kazhala/dotbare"

#z fz  changyuheng / fz
zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh

# oh-my-zsh libs
zplug "lib/completion", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh

# oh-my-zsh plugins
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/bgnotify", from:oh-my-zsh
# zplug "plugins/composer", from:oh-my-zsh
# zplug "plugins/zsh-interactive-cd", from:oh-my-zsh
# zplug "plugins/zsh-reload", from:oh-my-zsh

#MichaelAquilina
zplug "MichaelAquilina/zsh-you-should-use"

#Dotbare
# zplug "kazhala/dotbare"

#+++++++++++++++++++++++++++++++++PERSONAL ALIASES++++++++++++++++++++++++++++++++#
#IMPORTANT STUFF
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias update-kernel="sudo mkinitcpio -P"
alias update-boot="sudo mkinitcpio -P; sudo grub-mkconfig -o /boot/grub/grub.cfg"
#source .zshrc
alias .s="source $HOME/.zshrc"

#xboxdrv
alias xboxdrv-mtech="xboxdrv --evdev "/dev/input/event-mtech" --config ~/.config/xboxdrv/mtech.conf --debug"

#thefuck
alias fuck="thefuck --yeah"

#clear
alias cl="clear"

#yay => y
alias y="yay --noconfirm --noremovemake"
alias yu="yay -Syyuuu --noconfirm --noremovemake"

#LS ==> EXA
alias ls="exa -a -G --group-directories-first"

# remove db.lck on pacman
alias prem="sudo rm /var/lib/pacman/db.lck"

#Paru
alias p="paru"

#CAT ==> BAT
#alias cat="bat"

#GREP ==> RIPGREP(RG)
alias grep="rg"

#Using fzf to search and play files with smplayer
alias play="~/.scripts/play.sh"

#OpenVPN3 connect
alias sg1con="sudo openvpn3 session-start --config ~/.ovpn/white/sg1.ovpn"
alias sg1dis="sudo openvpn3 session-manage --disconnect --config ~/.ovpn/white/sg1.ovpn"
alias sg1res="sudo openvpn3 session-manage --restart --config ~/.ovpn/white/sg1.ovpn"

alias sg2con="sudo openvpn3 session-start --config ~/.ovpn/white/sg2.ovpn"
alias sg2dis="sudo openvpn3 session-manage --disconnect --config ~/.ovpn/white/sg2.ovpn"
alias sg2res="sudo openvpn3 session-manage --restart --config ~/.ovpn/white/sg2.ovpn"

alias sg3con="sudo openvpn3 session-start --config ~/.ovpn/white/sg3.ovpn"
alias sg3dis="sudo openvpn3 session-manage --disconnect --config ~/.ovpn/white/sg3.ovpn"
alias sg3res="sudo openvpn3 session-manage --restart --config ~/.ovpn/white/sg3.ovpn"

#check plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
    echo
fi

zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

