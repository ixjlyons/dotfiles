function venv
    set name '.venv'
    if test (count $argv) -gt 0
        set name $argv[1]
    end

    # If the env already exists, ask to overwrite.
    # -e exists
    if test -e $name
        while true
            # -[-P]rompt
            # -[-l]ocal (variable)
            read -P "$name exists. Overwrite it? [y/N]? " -l confirm
            switch $confirm
                case y Y
                    echo "Ooooooooook say bye!"
                    rm -rf $name
                    break
                case n N
                    echo "ok leaving it alone bye"
                    return 0
            end
        end
    end

    python -m venv $name
    source $name/bin/activate.fish
    pip install --upgrade pip
end
