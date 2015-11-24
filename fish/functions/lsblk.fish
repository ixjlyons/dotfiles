function lsblk
    command lsblk --output NAME,MAJ:MIN,SIZE,TYPE,MOUNTPOINT,FSTYPE,UUID $argv
end
