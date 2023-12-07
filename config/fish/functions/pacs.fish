function pacs --wraps=pacman\ -Slq\ \|\ fzf\ -m\ --preview\ \'cat\ \<\(pacman\ -Si\ \{1\}\)\ \<\(pacman\ -Fl\ \{1\}\ \|\ awk\ \"\{print\ \$2\}\"\)\'\ \|\ xargs\ -ro\ sudo\ pacman\ -S --description alias\ pacs=pacman\ -Slq\ \|\ fzf\ -m\ --preview\ \'cat\ \<\(pacman\ -Si\ \{1\}\)\ \<\(pacman\ -Fl\ \{1\}\ \|\ awk\ \"\{print\ \$2\}\"\)\'\ \|\ xargs\ -ro\ sudo\ pacman\ -S
  pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk "{print $2}")' | xargs -ro sudo pacman -S $argv
        
end
