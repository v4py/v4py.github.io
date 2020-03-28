#!/bin/sh

set -e

script_dir=$( dirname $( realpath "$0" ) )
root=$( realpath "$script_dir"/.. )

mtime() {
  stat -c %Y $( realpath "$1" )
}

cd "$root"
mkdir -p content
# need to specify full path to src for cp to be able to make symlinks
cp -rfsT "$root"/src content

cd content
find -iname \*.md -not -name LICENSE.md | while read in_path; do
  out_path=$( echo "$in_path" | sed 's/.md$/.ipynb/' )
  if [ ! -f "$out_path" ] || [ $( mtime "$in_path" ) -gt $( mtime "$out_path" ) ]; then
    if [ "$( basename "$in_path" )" == rest.md ]; then
      jupytext --execute "$in_path" --output "$out_path" --update-metadata '{"author": "Rudolf Rosa"}'
    else
      jupytext --execute "$in_path" --output "$out_path"
    fi
  fi
  rm -f "$in_path"
done
