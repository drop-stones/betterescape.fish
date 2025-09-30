function _betterescape_second --description "Handle second key press and perform escape if sequence matches"
    # Only process if first key was typed
    if test "$_betterescape_first_typed" = true
        set -l current_cursor_pos (commandline -C)

        # Check if the first key was typed just before current cursor position
        # The cursor should have moved by exactly 1 position since first key was typed
        if test (math $current_cursor_pos - $_betterescape_last_cursor_pos) -eq 1
            set -l current_time (_betterescape_get_time_ms)
            set -l time_diff (math $current_time - $_betterescape_last_time)

            if test $time_diff -le $betterescape_timeout
                commandline -f backward-delete-char # remove first key
                _betterescape_escape
                set -g _betterescape_first_typed false
                return
            end
        end
    end

    # insert second key and clear flag
    commandline -i $_betterescape_second_key
    set -g _betterescape_first_typed false
end
