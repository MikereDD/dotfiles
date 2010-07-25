#!/bin/sh
# just an example of how you could handle your downloads
# try some pattern matching on the uri to determine what we should do

# Some sites block the default wget --user-agent..
GET="wget --user-agent=Firefox --content-disposition --load-cookies=$XDG_DATA_HOME/uzbl/cookies.txt"

dest="$HOME/Downloads"
url="$8"

http_proxy="$9"
export http_proxy

test "x$url" = "x" && { echo "you must supply a url! ($url)"; exit 1; }

# Various Extentions Sorted
# Images
IEXTENSIONS="bmp eps gif ico jpe jpg jpeg pcx png ps psd svg tif tga xcf xpm"
# Audio
AEXTENSIONS="aac ac3 aif flac iff m3u m4a mid mp3 mpa ogg swa wav wma wv"
# Video
VEXTENSIONS="3gp arf asf avi flv ogm mkv mov mpg mp4 rm wmv vob"
#
case "$url" in
  *.torrent) (cd "$dest/torrent/watch/"; $GET "$url") ;;
  *.nzb)     (cd "$dest/nzb/queue/"; $GET "$url") ;;
  *)         (cd "$dest/browser"; $GET "$url") ;;
esac
