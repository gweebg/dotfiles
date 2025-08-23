function fish_greeting
end

# Keybinds
bind \e\[3\;5~ kill-word

# Abbreviations
abbr -a -- rc '$EDITOR /home/guilherme/.config/fish/config.fish'
abbr -a -- open xdg-open
abbr -a -- penv 'python3 -m venv .env'
abbr -a -- icat 'kitten icat'
abbr -a -- g gitui
abbr -a -- cd 'z'
abbr -a -- ls 'eza'
abbr -a -- ll 'eza -alh'
abbr -a -- tree 'eza --tree'

# Key-binds
# Alt + (-> | <-)  :  Move between previous and next directories
# Alt + l          :  Run 'ls' function
# Alt + p          :  Append '&| less' (pager)
# Alt + w          :  Description of command
# Alt + e          :  Open editor ($EDITOR)
# Alt + s          :  Prepend 'sudo' to command  


# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# Run starship
starship init fish | source
zoxide init fish | source

direnv hook fish | source

# source ~/.asdf/asdf.fish
