#Script for youtube-dl
alias ydl='youtube-dl'
alias ybest='youtube-dl -f best'
alias yopt='youtube-dl -F'
alias yvk720='youtube-dl -f url720'
alias yvk480='youtube-dl -f url480'
alias ydm720='youtube-dl -f http720'
alias ydm480='youtube-dl -f http480'

#Script for pacman-utils
alias pcr='sudo rm /var/lib/pacman/db.lck'
alias prs='sudo pacman -Syyuu'
alias pug="notify-send --urgency=critical --hint=string:x-dunst-stack-tag:update 'Starting Update' && sudo reflector -c 'Singapore' --sort score --verbose --save /etc/pacman.d/mirrorlist && yay -Syu --noconfirm --nocleanmenu --nodiffmenu --noeditmenu --noupgrademenu --removemake && notify-send --urgency=critical --hint=string:x-dunst-stack-tag:update 'Update Finished'"
alias pfl='sudo reflector -c "Singapore" --sort score --verbose --save /etc/pacman.d/mirrorlist && sudo pacman -Syyuu'
alias yrs='yay -Syyuu'

#Script for Nord VPN
alias ndc='nordvpn c Singapore'
alias ndd='nordvpn disconnect'
alias nds='nordvpn status'

#Script for shutdown
alias sht='shutdown'
alias sht60='shutdown +60'