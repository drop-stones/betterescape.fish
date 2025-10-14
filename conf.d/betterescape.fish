status is-interactive || exit

# Timeout in milliseconds (default: 300)
set -q betterescape_timeout || set -g betterescape_timeout 300

# Private variables
set -g _betterescape_first_typed false # first key is typed
set -g _betterescape_last_time 0 # the time when first key is typed
