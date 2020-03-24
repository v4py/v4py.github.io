---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.2'
      jupytext_version: 1.4.1
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

# Introduction

- started programming at uni, so it's never too late :)
- probably **the most useful skill** since learning to read

Interact links, to open the notebook interactively. If you have an
account at <https://jupyter.korpus.cz> (attendees of the V4Py summer
school do), you can also use that. But careful, due to some bugs in the
software, the links don't work as intended if you're not already logged
in. In that case:

1. Click on the Interact button once and log into JupyterLab.
2. Close the JupyterLab tab.
3. Click on the Interact button a second time. JupyterLab should now
   automatically open the appropriate notebook.
4. If that doesn't happen, try reloading the page.

# Python gives you wings!

![Python XKCD](https://imgs.xkcd.com/comics/python.png)

Credit: Randall Munroe, XKCD, <https://xkcd.com/353/>

# Target audience

NOTE: transform questions into statements about expected audience.

- Who has programmed before? In what language(s)? Python?
- What's your academic field? Linguistics, history, digital
  humanities...?
- Who is reasonably familiar with working with language data on a
  computer (e.g. corpora etc.)?
- Who knows what regular expressions are? Who uses them?
- What are you hoping to learn this week?

# About Python

![Python](./python.svg)

Credit: ???

- a simple, fun and approachable programming language
- FLOSS (Free, Libre, Open-Source Software) × e.g. Microsoft Word
- created in 1991 by Guido van Rossum
- why is it named Python?

Using Python:

- Python 2 vs. **Python 3**
- if you want to install it on your own computer: [the Anaconda
  Distribution](https://www.anaconda.com/distribution/)
- but we'll be using <https://jupyter.korpus.cz>

# NLTK Book

A great, longer free resource. <http://www.nltk.org/book/>

![NLTK Book](./nltk_book.jpg)

Credit: ???

# The NLP pipeline

NOTE: maybe leave this out? Not strictly necessary, this is probably
better to discuss in class, plus I shouldn't rely too much on NLTK Book
materials for licensing reasons.

![NLP](./dialogue.png)

Credit: ???

# Overview

- Python basics (functions, control flow, collections)
- The NLTK [package](http://www.nltk.org/) &
  [book](http://www.nltk.org/book) as a good starting point for people
  interested in language data
- [How text is represented inside
  computers](https://dlukes.github.io/unicode.html)
- Regular expressions in Python
- Accessing web services ("REST APIs") from Python & Automatic
  annotation of language data (tagging, parsing) -- both courtesy of
  [Rudolf Rosa](https://ufal.mff.cuni.cz/rudolf-rosa)
- Getting data into Python (raw text & tabular data)
- Some visualizations (dispersion plots, wordclouds)
- Case studies: collocation strength, keyword analysis

<!-- - Hackathon on Friday! -->

# Info about Jupyter Notebook / JupyterLab

This course consists of Python notebooks which you can open and interact
with using either the new
[JupyterLab](https://jupyterlab.readthedocs.io) environment or the
legacy [Jupyter Notebook](https://jupyter-notebook.readthedocs.io)
interface. For more information on both of these, including tutorials on
how to use them, check out the [Project Jupyter
website](https://jupyter.org). Some usage tips are also provided here as
[Appendix TODO](TODO/Make the most of Jupyter notebooks).

The easiest way to run JupyterLab or Jupyter Notebook is by using a
cloud service like [Binder](https://mybinder.org). With Binder, you
don't have to worry about installing anything on your computer, you just
open a link in your browser and start playing around with the target
notebook right away. At the beginning of each chapter, we'll therefore
provide Binder links to the corresponding notebooks for your
convenience. They look like this:

[Binder link](TODO)

Click on it to try it out!

The second most convenient way is to install the [Anaconda Python
distribution](https://www.anaconda.com/distribution/), because both
JupyterLab and Jupyter Notebook come bundled with it. After
installation, run the *Anaconda Navigator* program, which provides
buttons to launch them. You'll also have to manually download the
course's notebooks to your computer, so that you can work with them. All
of the course's notebooks are available in its [GitHub
repository](TODO).

More advanced users will probably be aware that both can also be
installed using standard command line Python package managers like
`conda` or `pip`. If the previous sentence sounds like gibberish to you,
don't worry, you can safely ignore it :)
