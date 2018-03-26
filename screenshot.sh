#!/bin/bash

FLAGS="-f"
while getopts ":raf" opt; do
  case ${opt} in
    r )
      FLAGS="-r"
      ;;
    a )
      FLAGS="-a"
      ;;
    f )
      FLAGS="-f"
      ;;
    \? )
      echo "Usage: cmd [-r|a|f]"
      exit
      ;;
  esac
done

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmpfile=$(mktemp /tmp/screenshot-region.XXXXXX)
spectacle $FLAGS -b -o $tmpfile -n
aplay -q $DIR/shutter.wav
xclip -selection clipboard -t image/png -i $tmpfile
rm $tmpfile
