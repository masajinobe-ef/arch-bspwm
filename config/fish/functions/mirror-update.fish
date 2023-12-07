function mirror-update --wraps='sudo reflector -l 20 --verbose --sort rate --save /etc/pacman.d/mirrorlist' --description 'alias mirror-update=sudo reflector -l 20 --verbose --sort rate --save /etc/pacman.d/mirrorlist'
  sudo reflector -l 20 --verbose --sort rate --save /etc/pacman.d/mirrorlist $argv
        
end
