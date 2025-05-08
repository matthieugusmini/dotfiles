if status is-interactive
    # Commands to run in interactive sessions can go here
end

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/matthieu.gusmini/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# https://github.com/fish-shell/fish-shell/issues/6643#issuecomment-590045287
set -gx GPG_TTY (tty)

# Starship
starship init fish | source

# fzf
fzf --fish | source
