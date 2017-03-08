#!/bin/bash

usage() {
cat <<EOF
Usage: script.sh ...

Options:
...
EOF
}

while getopts ":h" opt; do
  case "$opt" in
    h) usage
      exit 0
      ;;
    \?) echo "Unknown option \"$OPTARG\""
      usage
      exit 0
      ;;
  esac
done

# Takes all non-opt arguments as "input", so every
# argument after options. Support wildcard.
shift $(( OPTIND - 1 ))
inputs=("${@}")

