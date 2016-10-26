import http.get
import xml.read
import string.match

function http.status() {
  local status_code="${1? - param missing status code to explain}"

  http.get https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html |
  while http.status.read_next_tag ; do
    if string.match "$content" "$status_code" && [ "$tag" == "/a" ]; then
      echo "$content"
      http.status.read_next_tag && http.status.read_next_tag && [ "$tag" == "p" ] && echo "$content"
    fi
  done
}

http.status.read_next_tag() {
  xml.read tag content
}
