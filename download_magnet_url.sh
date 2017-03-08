#!/bin/bash

usage() {
cat <<EOF
Script per salvare i magnet link come file .torrent
nella cartella "watch" di rtorrent.

"magnet_link" è una stringa di testo. Per ottenerla
fare "copia link" (NON scaricare) sul magnet link
trovato sui motori di ricerca.

usage: ./download_magnet_url.sh "magnet_link"
EOF
}

case "$1" in
  -h|--help|'') usage
    exit 1
    ;;
esac

# magnet link shoul be enclosed in quotes.

# set your watch directory here
watchdir="$HOME/torrents/watch"
if [ -d "$watchdir" ] ; then
  cd "$watchdir"
else
  echo \"$watchdir\" non esiste. Controlla lo script
  exit 0
fi

[[ "$1" =~ xt=urn:btih:([^&/]+) ]] || exit;
echo "d10:magnet-uri${#1}:${1}e" > "meta-${BASH_REMATCH[1]}.torrent"
