function fish_user_key_bindings
    bind --key nul complete-and-search
    bind \b backward-kill-word
    bind \e\[3\;5~ kill-word
end

if type -q code-insiders; and not type -q code
    alias code=code-insiders
end
