export ZSH="$HOME/.oh-my-zsh"
export LANG=ru_RU.UTF-8

# Theme
ZSH_THEME="af-magic"

# Custom Highlight syntax
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4C566A,underline"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

if [[ $- != *i* ]]; then
	return
fi

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

plugins=(git z fzf)

source $ZSH/oh-my-zsh.sh

# fzf source
source /usr/share/fzf/key-bindings.zsh

# Show top 21 Commands used (thanks totoro
toppy() {
    history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n 21
}

amount() {
    ls -l | wc -l
}

# cd and ls after
cd() {
	builtin cd "$@" && command ls --group-directories-first --color=auto -F
}

# alias for making a directory and cd to it
mcd () {
    mkdir -p $1
    cd $1
}

# For tty
if [ "$TERM" = "linux" ] ; then
    echo -en "\e]P0232323"
fi

# Update thingy
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# alias for sourcing the zshrc
alias sr='source ~/.zshrc'

# apps
alias b="btop"
alias c="code"
alias g="git"
alias n="nano"

# alias for verbose cp, mv, rm, mkdir, cd, clear
alias mv="mv -v"
alias cp="cp -vr"
alias rm="rm -vr"
alias mkdir="mkdir -p"
alias ..="cd .."
alias cls="clear"

# alias for tar, zip
alias ctar="tar -zcvf"  # ctar <archive_compress>
alias utar="tar -zxvf"  # utar <archive_decompress> <file_list>
alias zz="zip -r"       # z <archive_compress> <file_list>
alias uz="unzip"        # uz <archive_decompress> -d <dir>

# alias for searching through ps
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# alias for searching and installing packages
alias pacs="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
# alias for searching and installing packages from AUR
alias yays="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"
# alias for searching and removing packages from system
alias pacr="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
# alias for searching packages from system
alias p="pacman -Q | fzf"
