function _betterescape_escape --description "Escape from insert mode, reset bind mode, and handle cursor position"
    if commandline -P
        commandline -f cancel
    else
        set fish_bind_mode default
        commandline -f repaint-mode
    end
end
