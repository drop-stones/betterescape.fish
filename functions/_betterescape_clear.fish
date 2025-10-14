function _betterescape_clear --description "Clears betterescape key bindings and related global variables"
    if set -q -g _betterescape_sequence && set -q -g _betterescape_first_key && set -q -g _betterescape_second_key
        if test $_betterescape_first_key = $_betterescape_second_key
            bind --erase --mode insert $_betterescape_first_key
        else
            bind --erase --mode insert $_betterescape_first_key
            bind --erase --mode insert $_betterescape_second_key
        end
        set --erase -g _betterescape_sequence
        set --erase -g _betterescape_first
        set --erase -g _betterescape_second
    end
end
