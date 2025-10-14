status is-interactive || exit

# Timeout in milliseconds (default: 300)
set -q betterescape_timeout || set -g betterescape_timeout 300

# Private variables
set -g _betterescape_first_typed false # first key is typed
set -g _betterescape_last_time 0 # the time when first key is typed

function _betterescape_on_sequence --on-variable betterescape_sequence --description "Set up betterescape key sequence and bindings when variable changes"
    # Clear keybinds
    _betterescape_clear

    # Return if betterescape_sequence is removed
    if not set -q betterescape_sequence || test -z $betterescape_sequence
        return 0
    end

    # Check the format of betterescape_sequence
    if not test (string length -- $betterescape_sequence) -eq 2
        echo "[error] 'betterescape_sequence' must be a two-character string."
        set --erase betterescape_sequence
        return 1
    end

    set -g _betterescape_sequence $betterescape_sequence
    set -g _betterescape_first_key (string sub --length 1 $_betterescape_sequence)
    set -g _betterescape_second_key (string sub --start 2 --length 1 $_betterescape_sequence)

    if test $_betterescape_first_key = $_betterescape_second_key
        bind --mode insert $_betterescape_first_key _betterescape_same
    else
        bind --mode insert $_betterescape_first_key _betterescape_first
        bind --mode insert $_betterescape_second_key _betterescape_second
    end
end

_betterescape_on_sequence
