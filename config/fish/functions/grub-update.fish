function grub-update --wraps='sudo grub-mkconfig -o /boot/grub/grub.cfg' --description 'alias grub-update=sudo grub-mkconfig -o /boot/grub/grub.cfg'
  sudo grub-mkconfig -o /boot/grub/grub.cfg $argv
        
end
