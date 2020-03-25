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

```python tags=["remove_cell"]
# Download NLTK resources. Remove code from START_NLTK_TMP to
# END_NLTK_TMP to store them in a permanent location instead of a
# temporary directory.
# --------------------------- START_NLTK_TMP ---------------------------
import os
import tempfile

nltk_data = os.path.join(tempfile.gettempdir(), "v4py", "nltk_data")
os.makedirs(nltk_data, exist_ok=True)
os.environ["NLTK_DATA"] = nltk_data
# ---------------------------- END_NLTK_TMP ----------------------------

import nltk

nltk.download(["punkt", "stopwords"])
```

- started programming at uni, so it's never too late :)
- probably **the most useful skill** since learning to read

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

<!-- #md tags=["epigraph"] -->

> On second thought, let's not go to Camelot. 'Tis a silly place.
>
> -- King Arthur, Monty Python and the Holy Grail

<!-- #endmd -->

- a simple, fun and approachable programming language
- FLOSS (Free, Libre, Open-Source Software) × e.g. Microsoft Word
- created in 1991 by Guido van Rossum
- why is it named Python?

Using Python:

- Python 2 vs. **Python 3**

# Running the code yourself

This book actually consists of a series of [Jupyter
notebooks](https://jupyter.org/), which is a file format, recognizable
by its `.ipynb` extension, which intermixes expository prose with
programming code; it can be opened using
[JupyterLab](https://jupyterlab.readthedocs.io/), which runs in your
browser. In the notebooks, code is stored inside code cells which can be
modified and run at will, which encourages interactive exploration and
makes learning easier. This is what a code cell looks like:

```python
1 + 1
```

You can see the code cell's output right below it -- in this case, it's
a plain old `2`.

If you can, it's a great idea to follow along in JupyterLab, running the
code in each chapter of the book yourself and tinkering with it. There
are several options for that. The easiest one is to use either the **▶
mybinder.org** or **▶ jupyter.korpus.cz** buttons at the top of the
page, which will take care of everything for you and open an interactive
version of this text in your browser.

Note that the second button requires that you have an account at
<https://jupyter.korpus.cz> (attendees of the V4Py summer school do),
and due to some bugs in the software which makes this possible, it
doesn't work as intended if you're not already logged in. In that case:

1. Click on the button once and log into JupyterLab.
2. Close the JupyterLab tab.
3. Click on the button a second time. JupyterLab should now
   automatically open the appropriate notebook.
4. If that doesn't happen, try reloading the page.

If you want to install Python on your own computer and run JupyterLab
locally, I would suggest using [the Anaconda
Distribution](https://www.anaconda.com/distribution/), which installs
Python alongside many popular additional packages and libraries for data
analysis. In that case, you'll be opening JupyterLab via the [Anaconda
Navigator](https://docs.anaconda.com/anaconda/navigator/), and you'll
need to [download the notebooks
manually](https://github.com/v4py/v4py.github.io/archive/master.zip)
(after unzipping, the notebooks are in the `content/` subdirectory).

# Example: a frequency analysis of this text

To get our feet wet, let's do a quick frequency analysis of the text
you're currently reading. If you've never programmed before, don't worry
if parts (or all) of the code below seems a little mysterious!  We'll
cover all of that in much more detail in the following chapters.
However, before we dive into the particulars, I think it's a good idea
to get acquainted with what actual useful Python code looks like, so
that we have a general picture of where we're headed. Without a global
perspective and a clear goal in our heads, it's easy to get discouraged
by the many seemingly unconnected details that await us along the way.

So take a while to look at each code chunk below, try and figure out
what its purpose might be and how it achieves it, try and discover
repeating patterns in Python's syntax and their meaning. Read the
commentary and let the programming vocabulary soak into your brain. It's
alright to be confused, it's OK not to understand precisely what each
and every word means. The goal at this point is to get familiar with how
Python code looks and how the terminology sounds, even if you don't
fully understand what's happening yet.

We start by **importing** the
[`requests`](https://requests.readthedocs.io/) *library*, which contains
functionality related to fetching data from the web. Think of it as
Python's equivalent of a simple web browser.

```python
import requests
```

<!-- #md tags=["popout"] -->

**HTTP** stands for [Hypertext Transfer
Protocol](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol).
It's the main protocol used for sending around data on the web.

<!-- #endmd -->

The **source code** for this book is stored in a [repository on
GitHub](https://github.com/v4py/v4py.github.io). I went ahead and
figured out what the download link for the present notebook is. We can
fetch the notebook by calling the `get()` **function** inside the
`requests` **module**, which returns an HTTP response.

```python
link = "https://raw.githubusercontent.com/v4py/v4py.github.io/master/content/intro.ipynb"
response = requests.get(link)
```

Inspecting the `response` **variable**, we see `<Response [200]>`. `200`
is the [HTTP status
code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) which
indicates that all went well with our request and we received a
sucessful response.

```python
response
```

If we don't know or remember which HTTP status code is which, we can
check that everything is fine by inspecting the `.ok` **attribute** on
the `response` **object**.

```python
response.ok
```

Hopefully, the contents of this notebook should be stored somewhere on
that `response` object. And indeed it is, we can access it as one long
**string** of **characters** via the `.text` attribute. Let's take a look
at a **slice** of the string, just to make sure we downloaded the right
document.

```python
string = response.text
string[500:550]
```

Great, that looks familiar. Now in order to do a frequency analysis, we
need to split that text into words or **tokens**, which is a technical
term used when we want to avoid the kind of philosophical hairsplitting
that linguists sometimes engage in with respect to what is or is not a
word. Referring to words as 'tokens' is basically a way of saying, "I
don't want to pick a fight about the precise meaning of 'word' right
now, I made a pragmatic decision to split the text into pieces which
broadly make sense, but of course reasonable people might disagree on
the details." It also allows us to be precise that we are referring to
specific *instances* of words. The word 'word' is ambiguous, a sentence
like "I know I screwed up." can be described as containing either 5
(total running) words or 4 (different) words. If we want to avoid
confusion, we can say instead that it consists of **5 tokens** and **4
types**.

Word-splitting or **tokenization** is a trickier problem than it might
seem at first glance, because punctuation keeps getting in the way. So
let's not do it manually ourselves, let's use instead the
`word_tokenize()` function in the [`nltk`](http://www.nltk.org/)
library, which hopefully covers some of the edge cases we wouldn't think
of right off the bat if we were to implement it ourselves off the top of
our head. This function returns a **list** of strings, and again we can
do a sanity check by inspecting a slice of it.

```python
import nltk

tokenized = nltk.word_tokenize(string.lower())
tokenized[100:115]
```

Looks fine. Notice that before tokenizing the string, we converted in to
**lowercase** using the `.lower()` **method**. This is because in our
frequency analysis, we probably don't want to make a distinction between
e.g. `token` and `Token`. They refer to the same thing, so they should
be counted together, but the computer doesn't know that, as far as it's
concerned, `token` is as different from `Token` as it is from
`grapefruit`, so it's our job to make them exactly the same by
lowercasing everything beforehand. We can measure the length of the list
and thus get the number of tokens using the `len()` function.

```python
len(tokenized)
```

That's quite a lot, thanks for reading so far!

But hang on, that count is likely to be somewhat inflated. First of all,
a lot of the tokens in the `tokenized` list are junk, at least
linguistically speaking, they are special characters related to the
notebook format.

```python
tokenized[:15]
```

Second of all, it doesn't take a linguist to realize that the most
common words in an English text will be words like `a` or `the`. We
probably don't want to include those in our frequency analysis, since
they're not very interesting, they don't tell us a lot. Luckily, `nltk`
has a list of these uninteresting **stopwords** for English which we can
load and store in a **set**, so that we can quickly check if a given
token is a stopword or not. The stopwords are stored in their lowercase
form, so it comes in handy that we already lowercased our input string
prior to tokenizing it.

```python
from nltk.corpus import stopwords

stop_list = stopwords.words("english")
stop_set = set(stop_list)
stop_list[:15]
```

We can now get rid of any unwanted tokens. The following code snippet is
a bit more complicated than the previous ones, it involves some
non-linear **control flow**, which is a fancy way of saying the code
doesn't just linearly execute from top to bottom, but it can run around
in circles for a while (the **for** statement) or potentially skip some
parts depending on whether a condition **evaluates** to true or false
(the **if** statement).

```python
# create a new empty
cleaned = []
# iterate over all the tokens in the tokenized list
for token in tokenized:
    # check if current token is "interesting"
    if token.isalpha() and token not in stop_set:
        # if so, append it to the cleaned list
        cleaned.append(token)
len(cleaned)
```

<!-- #md tags=["popout"] -->

‡ At least partially -- if you actually inspect the contents of `cleaned`,
you'll see that it still contains many tokens, like `cells` or
`metadata`, which look like regular words, but they don't occur in this
text, they're part of the notebook format structure.

<!-- #endmd -->

`cleaned` is a lot shorter than `tokenized`, so it looks like it
worked!‡ Note how Python uses **indentation** to encode the hierarchy
of **statements** in the code: everything which is indented under the
**for-loop header** on the second line is part of the **for-loop body**
and gets executed for each token in the tokenized list. Similarly,
everything indented under the **if header** only gets executed if the
conditional **expression** is satisfied. By dedenting, we escape the
tyranny of those fors and ifs, so that the last line gets executed only
once, after the for-loop has completed.

We are now finally in a position to create a **frequency distribution**,
using the `nltk.FreqDist` **class**. It's easy, we just **pass** it our
list of clean tokens.

<!-- #md tags=["popout"] -->

Each object in Python has a **type**. Some of those are built-in, like
strings, lists or sets. But users can also define new types of their
own; those are called **classes**. `nltk.FreqDist` is one of those
user-defined types.

<!-- #endmd -->

```python tags=["output_scroll"]
freq_dist = nltk.FreqDist(cleaned)
freq_dist
```

We can access individual **values** inside the frequency distribution by
requesting them using the corresponding **key**.

```python
freq_dist["python"]
```

We can also list the top $n$ items using the `.most_common()` method.

```python
freq_dist.most_common(10)
```

Based on the most frequent lexical items, it looks like this is a text
about Python programming and language data! That checks out.

Finally, we can visualize this result using a wordcloud, to get a quick
and intuitive overview of these important words.

```python tags=["full_width"]
from corpy.vis import wordcloud

wordcloud(freq_dist, size=(800, 400), rounded=True)
```

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

<!-- vim: set spell spelllang=en: -->
