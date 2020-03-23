.PHONY: help runall clean build serve site publish

help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  install     to install the necessary dependencies for jupyter-book to build"
	@echo "  clean       to clean out site build files"
	@echo "  build       to build the Jekyll input and store in _build/"
	@echo "  serve       to serve the repository locally with Jekyll"
	@echo "  site        to build the final site HTML, store in _site/"
	@echo "  publish     build _site/ and publish to GitHub pages"


install:
	jupyter-book install ./

content: src
	scripts/generate_content.sh

clean:
	python scripts/clean.py

build: content
	jupyter-book build ./ --overwrite

serve: build
	bundle exec guard

site: build
	bundle exec jekyll build
	touch _site/.nojekyll
	poetry export --format requirements.txt --without-hashes --output _site/requirements.txt

publish: site
	ghp-import -n -p -f _site
