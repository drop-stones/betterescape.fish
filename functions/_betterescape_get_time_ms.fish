function _betterescape_get_time_ms --description "Get current time in milliseconds"
    if command -v gdate >/dev/null
        gdate +%s%3N
    else
        date +%s%3N
    end
end
