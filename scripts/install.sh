#!/bin/sh

set -e

script_dir=$( dirname $( realpath "$0" ) )
root=$( realpath "$script_dir"/.. )

if ! command -v ruby >/dev/null 2>&1; then
  >&2 echo 'Install ruby (preferably <2.7), including dev files, first.'
  abort=1
fi
if ! command -v poetry >/dev/null 2>&1; then
  >&2 echo 'Install the poetry Python package manager first.'
  abort=1
fi
[ -n "$abort" ] && exit 1

cd "$root"
poetry install
gem install bundler -v 1.17.2

tmp=$( mktemp -d )
jupyter-book create --out-folder "$tmp" tmp
for resource in _includes _layouts _sass assets Guardfile runtime.txt Gemfile; do
  if [ -e "$resource" ]; then
    rm -rf "$resource"
  fi
  cp -r "$tmp/tmp/$resource" "$resource"
done
# jupyter-book has stopped copying over the Gemfile.lock for some
# reason, but the Ruby stuff depends on tons of evolving libraries that
# may easily break if an unexpected version is used, so you actually
# *do* want their Gemfile.lock to get the combination of deps which
# happened to work for the jupyter-book devs
cp "$( poetry env info --path )"/lib/python*/site-packages/jupyter_book/book_template/Gemfile.lock .
for patch in patches/*; do
  patch -p1 <"$patch"
done

jupyter-book install ./
