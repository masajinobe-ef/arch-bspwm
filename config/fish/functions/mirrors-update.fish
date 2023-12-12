function mirrors-update --wraps='reflector --verbose --sort rate -p https -l 10 --save /etc/pacman.d/mirrorlist' --wraps='sudo reflector --verbose --sort rate -p https -l 10 --save /etc/pacman.d/mirrorlist' --description 'alias mirrors-update=sudo reflector --verbose --sort rate -p https -l 10 --save /etc/pacman.d/mirrorlist'
  sudo reflector --verbose --sort rate -p https -l 10 --save /etc/pacman.d/mirrorlist $argv
        
end
