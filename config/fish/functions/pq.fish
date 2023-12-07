function pq --wraps='pacman -Q | fzf' --description 'alias pq=pacman -Q | fzf'
  pacman -Q | fzf $argv
        
end
