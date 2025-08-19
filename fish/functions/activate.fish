function activate
    set path (test -n "$argv[1]"; and echo $argv[1]; or echo .env)

    set activate_file "$path/bin/activate.fish"
    if test -e "$activate_file"
        source "$activate_file"
    else
        echo "error: activate.fish not found in $activate_file"
    end
end

