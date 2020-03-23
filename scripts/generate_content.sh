#!/bin/sh

script_dir=$( dirname $( realpath "$0" ) )
root=$( realpath "$script_dir"/.. )

cd "$root"
rm -rf content
# need to specify full path to src for cp to be able to make symlinks
cp -rs "$root"/src content

cd content
find -iname \*.md | while read fname; do
  if [ "$( basename "$fname" )" != LICENSE.md ]; then
    jupytext --to notebook --execute "$fname"
    rm -f "$fname"
  fi
done
