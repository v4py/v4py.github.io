.PHONY: help install update clean build serve site publish

help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  install     to set up the environment and install the dependencies for the book to build"
	@echo "  update      to update the dependencies to the latest semver-compatible versions"
	@echo "  clean       remove ignored files (built site, caches etc.)"
	@echo "  build       to build the book and store it in _build"
	@echo "  serve       to serve the book locally with the http.server module"
	@echo "  publish     build and publish to GitHub pages"

install:
	poetry install
	scripts/do_patches.sh

# `poetry update` can't currently be used to keep pip and setuptools
# up-to-date:
# - https://github.com/python-poetry/poetry/issues/1651
# - https://github.com/python-poetry/poetry/issues/1584#issuecomment-567628022
update:
	poetry update
	poetry run pip install -U pip setuptools
	scripts/do_patches.sh

clean:
	git clean -dfX

# --all rebuilds all pages, which is currently necessary in order to get
# the updated TOC everywhere, even on pages which haven't been modified
build:
	poetry run jupyter-book build src --path-output . --all

serve: build
	poetry run python -m http.server --directory _build/html

publish: build
	poetry export --format requirements.txt --without-hashes --output _build/html/requirements.txt
	poetry run ghp-import -b master -m Publish -n -p -f _build/html
