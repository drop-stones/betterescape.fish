function _betterescape_second --description "Handle second key press and perform escape if sequence matches"
    # Only process if first key was typed and previous character matches first key
    if test "$_betterescape_first_typed" = true && test (commandline -C) -gt 0
        set -l prev_char (string sub --start -1 --length 1 (commandline --cut-at-cursor))

        if test "$prev_char" = "$_betterescape_first_key"
            set -l current_time (_betterescape_get_time_ms)
            set -l time_diff (math $current_time - $_betterescape_last_time)

            if test $time_diff -le $betterescape_timeout
                commandline -f backward-delete-char # remove 'j'
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
