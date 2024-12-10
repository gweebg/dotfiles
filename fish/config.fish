if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
   bunnyfetch
end

function fish_command_not_found
    echo unknown command $argv[1]
end

# Keybinds
bind \e\[3\;5~ kill-word

# Abbreviations
abbr -a -- rc '/usr/bin/nano /home/guilherme/.config/fish/config.fish'
abbr -a -- open xdg-open
abbr -a -- env 'python3 -m venv .env'
abbr -a -- jar 'java -jar'
abbr -a -- icat 'kitten icat'
abbr -a -- ssh-enemyless 'ssh guilherme@192.168.1.83'
abbr -a -- g gitui

abbr -a -- omw 'cd /home/guilherme/Documents/Projects/oh-my-wash/oh-my-wash'



# zoxide
abbr -a -- cd 'z'

# exa
abbr -a -- ls 'exa'
abbr -a -- ll 'exa -alh'
abbr -a -- tree 'eza --tree'

abbr -a -- vencord 'sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'

function activate
    if test -n "$argv[1]"
	set path $argv[1]
	if test -e "$path/bin/activate.fish"
	    source "$path/bin/activate.fish"
	else
	    echo "error: activate.fish not found in $path/bin"
	end
    else
	if test -e ".env/bin/activate.fish"
	    source ".env/bin/activate.fish"
	else
	    echo "error: activate.fish not found in .evn/bin"
	end
    end
end

# Key-binds
# Alt + (-> | <-)  :  Move between previous and next directories
# Alt + l          :  Run 'ls' function
# Alt + p          :  Append '&| less' (pager)
# Alt + w          :  Description of command
# Alt + e          :  Open editor ($EDITOR)
# Alt + s          :  Prepend 'sudo' to command  

# Run starship
starship init fish | source
zoxide init fish | source

source ~/.asdf/asdf.fish


# Created by `pipx` on 2024-04-25 20:18:39
set PATH $PATH /home/guilherme/.local/bin
set PATH $PATH /home/guilherme/.fly/

# Flyctl
set FLYCTL_INSTALL /home/guilherme/.fly
set PATH $PATH "$FLYCTL_INSTALL/bin"

# Android
set ANDROID_HOME "$HOME/Android/Sdk"
set PATH $PATH "$ANDROID_HOME/emulator"
set PATH $PATH "$ANDROID_HOME/platform-tools"

# Flutter
set PATH $PATH "$HOME/.flutter/flutter/bin"

# pnpm
set -gx PNPM_HOME "/home/guilherme/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

