function pacless
    cat /var/log/pacman.log | grep "upgraded" | less
end
