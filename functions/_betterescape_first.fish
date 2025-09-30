function _betterescape_first --description "Handle first key press for betterescape sequence detection"
    set -g _betterescape_first_typed true
    set -g _betterescape_last_time (_betterescape_get_time_ms +%s%3N)
    set -g _betterescape_last_cursor_pos (commandline -C)
    commandline -i $_betterescape_first_key
end
