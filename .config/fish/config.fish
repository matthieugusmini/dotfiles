if status is-interactive
    # Commands to run in interactive sessions can go here
end

# direnv
direnv hook fish | source

# pyenv
pyenv init - fish | source

# zoxide
zoxide init --cmd cd fish | source

