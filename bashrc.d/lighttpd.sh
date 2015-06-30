serv() {

if [[ -z $(which lighttpd) ]]; then
  echo "lighttpd not found"
  return 1
fi

# kill first
pgrep lighttpd | xargs kill > /dev/null 2>&1

local conf=/tmp/lighttpd.$$.conf

cat << EOF > $conf
server.document-root = "$(pwd)"

server.port = 8001

mimetype.assign = (
  ".html" => "text/html",
  ".htm" => "text/html",
  ".js" => "application/javascript",
  ".css" => "text/css",
  ".json" => "application/json",
  ".png" => "image/png",
  ".jpg" => "image/jpeg",
  ".ogg" => "application/ogg",
  ".mp3" => "audio/mpeg",
  ".wav" => "audio/wav"
)

index-file.names = ( "index.html" )
EOF

lighttpd -f $conf

}
