#!/bin/bash
if [ $# -eq 0 ]; then
  echo "help"
  exit 0 # Exit with success status
fi

while getopts ":hpl" opt; do
  case "$opt" in
    h) [ -z "$mode" ] && mode="help" || mode="duplicate" ;;
    p) [ -z "$mode" ] && mode="purge" || mode="duplicate" ;;
    l) [ -z "$mode" ] && mode="list" || mode="duplicate" ;;
    \?) [ -z "$mode" ] && mode="unknown" || mode="duplicate" ;;
  esac
done

shift $((OPTIND - 1))

if [ "$#" -ne 0 ] && [ -z "$mode" ]; then
  mode="junk"
fi

if [ $# -gt 0 ] && [ "$mode" != "junk" ]; then
  echo "$mode: unexpected $@"
elif [ "$mode" = "junk" ] && [ $# -gt 0 ]; then
  echo "junk: $@"
else
  echo "$mode"
fi
