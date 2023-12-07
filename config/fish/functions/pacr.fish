function pacr --wraps=pacman\ -Qq\ \|\ fzf\ --multi\ --preview\ \'pacman\ -Qi\ \{1\}\'\ \|\ xargs\ -ro\ sudo\ pacman\ -Rns --description alias\ pacr=pacman\ -Qq\ \|\ fzf\ --multi\ --preview\ \'pacman\ -Qi\ \{1\}\'\ \|\ xargs\ -ro\ sudo\ pacman\ -Rns
  pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns $argv
        
end
