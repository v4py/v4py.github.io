.PHONY: help install clean build serve site publish

export GEM_HOME := $(CURDIR)/.gems
export PATH := $(GEM_HOME)/bin:$(PATH)

help:
	@echo "Make sure you're running these in 'poetry shell'."
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  install     to install the necessary dependencies for jupyter-book to build"
	@echo "  clean       remove ignored files (built site, caches, non-customized resources)"
	@echo "  build       to build the Jekyll input and store in _build/"
	@echo "  serve       to serve the repository locally with Jekyll"
	@echo "  site        to build the final site HTML, store in _site/"
	@echo "  publish     build _site/ and publish to GitHub pages"

install:
	scripts/install.sh

content: src
	scripts/src2content.sh

clean:
	git clean -dfX

build: content
	jupyter-book build ./ --overwrite

serve: build
	bundle exec guard

site: build
	bundle exec jekyll build
	touch _site/.nojekyll
	poetry export --format requirements.txt --without-hashes --output _site/requirements.txt

publish: site
	ghp-import -b master -m Publish -n -p -f _site
