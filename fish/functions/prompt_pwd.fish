# replaces '/home/$USER' with '~'
function prompt_pwd
    if test "$PWD" != "$HOME"
        printf "%s" (echo $PWD | sed -e 's|/private||' -e "s|^$HOME|~|")
    else
        echo '~'
    end
end
