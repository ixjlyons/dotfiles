function qopen
    xdg-open $argv </dev/null >/dev/null 2>&1 & disown
end
