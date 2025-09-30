function _betterescape_same --description "Handle repeated key press for betterescape sequence (both keys identical)"
    if test "$_betterescape_first_typed" = false
        _betterescape_first
    else
        _betterescape_second
    end
end
