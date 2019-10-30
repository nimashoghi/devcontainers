function fish_user_key_bindings
    bind --key nul complete-and-search
end

if type -q code-insiders; and not type -q code
    alias code=code-insiders
end
