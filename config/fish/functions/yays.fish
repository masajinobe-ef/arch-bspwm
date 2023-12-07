function yays --wraps=yay\ -Slq\ \|\ fzf\ -m\ --preview\ \'cat\ \<\(yay\ -Si\ \{1\}\)\ \<\(yay\ -Fl\ \{1\}\ \|\ awk\ \"\{print\ \$2\}\"\)\'\ \|\ xargs\ -ro\ \ yay\ -S --description alias\ yays=yay\ -Slq\ \|\ fzf\ -m\ --preview\ \'cat\ \<\(yay\ -Si\ \{1\}\)\ \<\(yay\ -Fl\ \{1\}\ \|\ awk\ \"\{print\ \$2\}\"\)\'\ \|\ xargs\ -ro\ \ yay\ -S
  yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk "{print $2}")' | xargs -ro  yay -S $argv
        
end
