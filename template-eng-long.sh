#!/bin/bash

usage() {
cat <<EOF
Usage: script.sh ...

Options:
...
EOF
}

#unset file
verbose=0

while true ; do
  case "$1" in
    -h|-\?|--help)
      usage
      exit 0
      ;;
    -f|--file)
      if [ -n "$2" ] ; then
        file="$2"
        shift 2
        continue
      else
        echo "ERROR: \"$1\" requires a non-empty option argument." >&2
        exit 1
      fi
      ;;
    -v|--verbose)
      verbose=$((verbose + 1)) # Each -v argument adds 1 to verbosity.
      ;;
    --)
      shift
      break
      ;;
    -?*)
      printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
      ;;
    *) # Default case: If no more options then break out of the loop.
      break
  esac

  shift # go to next argument
done

# Takes all non-opt arguments as "input", so every
# argument after options. Support wildcard.
shift $(( OPTIND - 1 ))
inputs=("${@}")

