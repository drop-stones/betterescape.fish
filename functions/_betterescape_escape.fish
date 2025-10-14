function _betterescape_escape --description "Escape from insert mode, reset bind mode, and handle cursor position"
    if commandline -P
        commandline -f cancel
    else
        set fish_bind_mode default
        if test -n (commandline --cut-at-cursor)
            commandline -f backward-char
        end
        commandline -f repaint-mode
    end
end
