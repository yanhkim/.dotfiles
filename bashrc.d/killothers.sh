killothers() {
    local current_pts=`ps | tail -n +2 | awk '{print $2}' | uniq | sed 's/pts/pts\\\\/'`
    for PID in $(ps x | grep sshd | grep -v grep | sed "/$current_pts/d" | awk '{print $1}')
    do
        kill $PID
    done
}
