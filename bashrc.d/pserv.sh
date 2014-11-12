pserv() {
    local port=8001
    if [ $1 ]; then
        port=$1
    fi
    python -m SimpleHTTPServer $port > /dev/null 2>&1 &
}
