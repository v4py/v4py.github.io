#!/bin/sh

venv=$( poetry env info -p )
launch_patch=$( realpath patches/launch.py.patch )
cd "$venv"/lib/python*/site-packages/sphinx_book_theme
patch -p1 <"$launch_patch"
