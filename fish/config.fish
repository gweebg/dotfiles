function fish_greeting
end

# Keybinds
bind \e\[3\;5~ kill-word

# Abbreviations
abbr -a -- rc 'nvim /home/guilherme/.config/fish/config.fish'
abbr -a -- open xdg-open
abbr -a -- icat 'kitten icat'
abbr -a -- g gitui
abbr -a -- cd 'z'
abbr -a -- ls 'eza'
abbr -a -- ll 'eza -alhg'
abbr -a -- tree 'eza --tree'
abbr -a -- clip 'xsel --clipboard'

# Key-binds
# Alt + (-> | <-)  :  Move between previous and next directories
# Alt + l          :  Run 'ls' function
# Alt + p          :  Append '&| less' (pager)
# Alt + w          :  Description of command
# Alt + e          :  Open editor ($EDITOR)
# Alt + s          :  Prepend 'sudo' to command  


# starship
starship init fish | source

# z
zoxide init fish | source

# direnv
direnv hook fish | source

# source ~/.asdf/asdf.fish
/home/guilherme/.local/bin/mise activate fish | source

# opencode
fish_add_path /home/guilherme/.opencode/bin
