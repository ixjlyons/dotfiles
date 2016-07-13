function pacless
    cat /var/log/pacman.log | egrep "upgraded|installed" | less
end
