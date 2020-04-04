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

# Parting words

# Where to go from here

Now that you've made it to the end, perhaps you're wondering where to go
from here. Programming is perhaps the easiest skill to learn using only
the internet, so there are many options. There's also always room for
improvement and learning new things, it's a lifelong journey. In lieu of
parting words, here are some tips on where to get started, at least in
the world of Python.

Thank you for reading so far, and if you have any suggestions for
improvement, additions, or just spotted a few typos, please [report them
on GitHub](https://github.com/v4py/v4py.github.io/issues)!

# Books

<!-- #md tags=["popout"]-->
<a href="https://www.nltk.org/book/" target="_blank">
<img src="images/outro/nltk_book.jpg" width="200" alt="Natural Language Processing with Python book cover">
</a>
<!-- #endmd -->

As a general introduction to Python programming which focuses on
linguistic applications, I've already recommended [*Natural Language
Processing with Python: Analyzing Text with the Natural Language
Toolkit*](https://www.nltk.org/book/) by Steven Bird, Ewan Klein and
Edward Loper, and I'm going to recommend it again. It's a great
resource, all the more useful since it's freely available online. It
doesn't provide just recipes on how to use the latest and greatest fancy
stuff in
[NLP](https://en.wikipedia.org/wiki/Natural_language_processing),
treating the tools as black boxes, but rather focuses on understanding
algorithms and concepts and improving your programming skills. This
means that it often spends time on less cutting-edge methods, which are
however conceptually simpler and thus have better teaching value.
Depending on what your immediate needs are, this may be a strength or a
weakness, but in the long run, I would argue that every programming
linguist should spend some time honing their programming skills instead
of always blindly following how-to style recipes, because even
copy-pasting black box code can go seriously wrong if you don't have a
larger picture of what's going on.

<!-- #md tags=["popout"]-->
<a href="https://jakevdp.github.io/PythonDataScienceHandbook/" target="_blank">
<img src="images/outro/python_data_science.png" width="200" alt="Python Data Science Handbook cover">
</a>
<!-- #endmd -->

On perhaps a more practical note, I can definitely recommend Jake
VanderPlas's [*Python Data Science
Handbook*](https://jakevdp.github.io/PythonDataScienceHandbook/), an
other great resource which is also freely available online. This book is
not concerned with NLP per se but rather with data analysis, i.e. with
what happens after you've processed your text data and want to do some
statistical modeling or machine learning with it. This has traditionally
been the domain of [R](https://www.r-project.org/), especially among
linguists, but R is a very idiosyncratic language which encourages the
copy-paste, black box approach: while it sometimes provides pleasant and
easy-to-use abstractions (especially in the
[tidyverse](https://www.tidyverse.org/) third-party packages), building
them yourself or wiring them together can be challenging because the
underlying language is not really well-designed, edge cases and
surprising behaviors abound. Python is much easier to wrap your head
around, perhaps because it has always been intended as a more
general-purpose programming language, but by the same token, it can be
sometimes hard to know which libraries and techniques to use when
getting started with data analysis in Python. The *Python Data Science
Handbook* is there to help you with that.

<!-- #md tags=["popout"]-->
<a href="https://jakevdp.github.io/WhirlwindTourOfPython/" target="_blank">
<img src="images/outro/whirlwind_tour.gif" width="200" alt="A Whirlwind Tour of Python cover">
</a>
<!-- #endmd -->

Finally, if you just want a fast-paced overview of Python syntax and
features, another great free resource, also by Jake VanderPlas, is [*A
Whirlwind Tour of
Python*](https://jakevdp.github.io/WhirlwindTourOfPython/). It's pretty
condensed and expects the reader to be reasonably familiar with
programming concepts terminology, but in exchange, it offers a
practical-minded and well-organized reference resource which you can use
to quickly refresh your knowledge on specific areas of Python
programming.

# Videos

Unlike conferences in linguistics, programming conferences are often
recorded and professionally produced videos (including presentation
slides) are subsequently made available, most often for free. For
tutorials and workshops, the materials often remain available long after
the conference via sites like GitHub, so you can follow along at your
leisure.

Since conferences are popular, there's potentially *a lot* of watching
material, not all of it great. Some people are better programmers than
speakers or teachers, some are good at neither, but there are so many
conferences that they can accommodate all of them. Below is a collection
of videos that I either consider rare gems of the Python conference
circuit, or that are particularly relevant to the subject of analyzing
language data, or both.

If you end up searching yourself, I can recommend almost anything by
either Raymond Hettinger, Ned Batchelder or David Beazley. Their
contributions are consistently extremely informative, well-prepared and
entertaining at the same time.

## Improving your Python chops

<!-- Beazley: builtins _____________________________________________ -->

<!-- #md tags=["popout"] -->

A great tour of Python's built-in functionality, i.e. stuff that's
always available, without having to load any libraries, and tips and
tricks on how to use it. A great way to top off your Python initiation
and graduate to a proficient beginner.

<!-- #endmd -->

<!-- #md -->
<iframe width="560" height="315"
  src="https://www.youtube-nocookie.com/embed/lyDLAutA88s" frameborder="0"
  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen>
</iframe>
<!-- #endmd -->

<!-- Batchelder: variables _________________________________________ -->

<!-- #md tags=["popout"] -->

This is perhaps the most useful intermediate Python talk ever. It'll
clear up any misconceptions about how variables work in Python that you
might have accumulated on your programming journey so far, and enable
you to work on more complicated and larger pieces of code with more
confidence.

<!-- #endmd -->

<!-- #md -->
<iframe width="560" height="315"
  src="https://www.youtube-nocookie.com/embed/_AEJHKGk9ns" frameborder="0"
  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen>
</iframe>
<!-- #endmd -->

<!-- =============================================================== -->
<!-- #md tags=["full_width"] -->
<hr style="margin-top: 4rem;">
<!-- #endmd -->

## Data analysis and NLP

<!-- VanderPlas: PyData 101 ________________________________________ -->

<!-- #md tags=["popout"] -->

If you're interested in using Python for data analysis, I can recommend
anything by Jake VanderPlas (who wrote the *Python Data Science
Handbook* mentioned earlier). This is an introductory talk which
provides basic orientation in the Python data analysis landscape -- what
tools exist and when to use which. As a keynote, it's somewhat longer
and also provides a bit of historical background on Python, with a bias
for data science applications of course.

<!-- #endmd -->

<!-- #md -->
<iframe width="560" height="315"
  src="https://www.youtube-nocookie.com/embed/DifMYH3iuFw" frameborder="0"
  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen>
</iframe>
<!-- #endmd -->

<!-- VanderPlas: statistics ________________________________________ -->

<!-- #md tags=["popout"] -->

A bit unsure how statistics works, or what it's even good for? This
particular talk may be titled *Statistics for Hackers*, but in reality
it's geared towards anyone with a keen mind who's interested in
statistics but hasn't had extensive formal training in math, which means
they sometimes struggle with a formula-heavy approach. Which often
applies to linguists, including myself. This may also be a good place to
point out that ['hacker'](https://en.wikipedia.org/wiki/Hacker) doesn't
always (and certainly not here) refer to someone who breaks into other
people's computers.

<!-- #endmd -->

<!-- #md -->
<iframe width="560" height="315"
  src="https://www.youtube-nocookie.com/embed/Iq9DzN6mvYA" frameborder="0"
  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen>
</iframe>
<!-- #endmd -->

<!-- VanderPlas: cutting-edge viz __________________________________ -->

<!-- #md tags=["popout"] -->

Visualization is currently a rapidly evolving landscape in Python, and
this talk is about new developments based on the *grammar of graphics*
and *declarative visualization* approach, which was popularized by the R
package [ggplot2](https://ggplot2.tidyverse.org/). The first part is a
teaches you how to think about visualization in general, while the
second introduces the [Altair](https://altair-viz.github.io/) library.

<!-- #endmd -->

<!-- #md -->
<iframe width="560" height="315"
  src="https://www.youtube-nocookie.com/embed/vTingdk_pVM" frameborder="0"
  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen>
</iframe>
<!-- #endmd -->

<!-- VanderPlas: traditional viz ___________________________________ -->

<!-- #md tags=["popout"] -->

By contrast, this older talk gives an overview of the Python
visualization landscape including the more traditional and established
Python visualization tools, which many people continue using and which
aren't going away anytime soon. Their advantage is that they're mature,
stable and widely known, so it can be much easier to get help on how to
use them from random people on the internet. A good accompanying
resource for this talk is [Part
4](https://jakevdp.github.io/PythonDataScienceHandbook/04.00-introduction-to-matplotlib.html)
of the *Python Data Science Handbook*.

<!-- #endmd -->

<!-- #md -->
<iframe width="560" height="315"
  src="https://www.youtube-nocookie.com/embed/FytuB8nFHPQ" frameborder="0"
  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen>
</iframe>
<!-- #endmd -->

<!-- Zhao: NLP tutorial ____________________________________________ -->

<!-- #md tags=["popout"] -->

An NLP tutorial whose most valuable aspect is that if offers an extended
worked example of data analysis, from collecting raw data to
communicating insights. It gives a very good idea of what this entire
process typically looks like and what are the pitfalls to look out for.

<!-- #endmd -->

<!-- #md -->
<iframe width="560" height="315"
  src="https://www.youtube-nocookie.com/embed/xvqsFTUsOmc" frameborder="0"
  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen>
</iframe>
<!-- #endmd -->

<!-- =============================================================== -->
<!-- #md tags=["full_width"] -->
<hr style="margin-top: 4rem;">
<!-- #endmd -->

## War stories

<!-- Beazley: mission impossible ___________________________________ -->

<!-- #md tags=["popout"] -->

A real-life story on how Python helped David Beazley to make sense of
large amounts of unknown data in order to prepare an expert testimony in
a legal case. More on the entertaining side than the educational, but it
*will* teach you that Python is a Swiss-army knife for slicing and
dicing data. The *Mission: Impossible* of programming conference talks,
with Python starring as agent Ethan Hunt!

<!-- #endmd -->

<!-- #md -->
<iframe width="560" height="315"
  src="https://www.youtube-nocookie.com/embed/RZ4Sn-Y7AP8" frameborder="0"
  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen>
</iframe>
<!-- #endmd -->

<!-- =============================================================== -->
<!-- #md tags=["full_width"] -->
<hr style="margin-top: 4rem;">
<!-- #endmd -->

## Nuts and bolts (advanced)

And finally, here are a few more advanced talks which I heartily
recommend watching after you've spent a little more time with Python.

<!-- Hettinger: dictionaries _______________________________________ -->

<!-- #md tags=["popout"] -->

Dictionaries are the bread and butter of the Python programmer, and
they're also at the core of how many of the features in the language
work. As such, their implementation has evolved over the years to
incorporate increasingly clever tricks. Learn what they are from the
proverbial horse's mouth, Python core developer Raymond Hettinger, who's
also one of the most consistently entertaining conference speakers I've
seen!

<!-- #endmd -->

<!-- #md -->
<iframe width="560" height="315"
  src="https://www.youtube-nocookie.com/embed/npw4s1QTmPg" frameborder="0"
  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen>
</iframe>
<!-- #endmd -->

<!-- Hettinger: concurrency ________________________________________ -->

<!-- #md tags=["popout"] -->

Another talk by Raymond Hettinger, this time about making the computer
do multiple things at the same time. Spoiler: it's hard to get this
right, and you should probably think twice whether you really needed
before you start tinkering with it.

<!-- #endmd -->

<!-- #md -->
<iframe width="560" height="315"
  src="https://www.youtube-nocookie.com/embed/9zinZmE3Ogk" frameborder="0"
  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen>
</iframe>
<!-- #endmd -->

<!-- NJ Smith: trio ________________________________________________ -->

<!-- #md tags=["popout"] -->

On a similar topic as the previous one, a talk on how computers can
*pretend* they're doing several things at the same time by quickly
switching between tasks, and on designing a Python library which makes
such programming fairly intuitive and less error-prone. If you've heard
the buzzwords `async` and `await`, they feature prominently.

<!-- #endmd -->

<!-- #md -->
<iframe width="560" height="315"
  src="https://www.youtube-nocookie.com/embed/oLkfnc_UMcE" frameborder="0"
  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen>
</iframe>
<!-- #endmd -->

<!-- =============================================================== -->
<!-- #md tags=["full_width"] -->
<hr style="margin-top: 4rem;">
<!-- #endmd -->

# Libraries

Finally, let's take a look at some library recommendations. In Python,
there are often multiple libraries available to help you do the same
thing, or that at least partially overlap in the domain they're trying
to cover. For a newcomer, it may be sometimes hard to decide which to
use when they've never heard about any of them. The purpose of this
(admittedly non-exhaustive and biased) list is to familiarize yourself
with some of the more popular and well-designed ones, so that when they
come up in your searches, you can lean towards them as a first choice.

Some of these have already come up over the course of the book, some
haven't, and some you probably won't need until you've programmed in
Python for a while, so don't feel like you immediately need to start
using every single one of those.

As a reminder, additional libraries are typically installed using the
`pip` command line tool, and command line programs can be run from
within JupyterLab by prefixing them with a `!`. For instance, to install
the package [`pyrsistent`](https://pyrsistent.readthedocs.io/):

```python tags=["output_scroll"]
!pip install pyrsistent
```

Or `!pip install --user pyrsistent` if that fails with some kind of
permission error. If you've installed Python on your own computer using
the [Anaconda Distribution](https://www.anaconda.com/distribution/),
then you can also use the [Anaconda
Navigator](https://docs.anaconda.com/anaconda/navigator/) GUI or the
[`conda`](https://docs.conda.io/) command line tool.

## NLP

- [`nltk`](https://nltk.org/): the Natural Language Toolkit offers great
  resources both for learning about NLP and doing it in practice
- [`spacy`](https://spacy.io/) focuses more on applied NLP and offers
  convenient black-box-type APIs for a variety of practical tasks
- [`ufal.morphodita`](https://pypi.org/project/ufal.morphodita/) and
  [`ufal.udpipe`](https://pypi.org/project/ufal.udpipe/) for
  morphological tagging and syntactic parsing. These are automatically
  generated wrappers for the C++ libraries `morphodita` and `udpipe` and
  as such, they might be somewhat hard to use for beginners, though
  examples are provided. For a more convenient API added on top of these
  more low-level libraries, see the
  [`corpy`](https://corpy.readthedocs.io/) library.
- [`regex`](https://pypi.org/project/regex/) is a regular expression
  library with enhanced Unicode support compared to the standard library
  `re` module. The API is the same though, so use [`re`'s
  documentation](https://docs.python.org/3/library/re.html) to learn how
  to use `regex`, and only consult `regex`'s documentation to learn
  about additional features.
- language data sometimes comes in
  [XML](https://en.wikipedia.org/wiki/XML) format. Though Python does
  have facilities for [processing XML in the standard
  library](https://docs.python.org/3.8/library/xml.etree.elementtree.html#tutorial),
  the [`lxml`](https://lxml.de/) offers more functionality and
  robustness. The docs are somewhat old-fashioned but the tutorial parts
  (e.g. [here](https://lxml.de/tutorial.html)) are well-written. What
  *can* sometimes be a somewhat painful experience is searching through
  the [API reference](https://lxml.de/api/index.html) for specific
  functions or methods -- even after years of intermitten use, it still
  feels a bit like a maze to me.

## Fetching data from the web

- [`requests`](https://requests.readthedocs.io/) for fetching individual
  web pages and interacting with [REST APIs](rest)
- [`requests_html`](https://requests.readthedocs.io/projects/requests-html/)
  for fetching individual web pages and slicing and dicing their HTML
  content
- [`scrapy`](https://scrapy.org/) is a flexible, configurable [web
  crawler](https://en.wikipedia.org/wiki/Web_crawler), i.e. a tool which
  can help you fetch large amounts of data from the web without having
  to specify each page manually as with `requests`
- [`spiderling`](http://corpus.tools/wiki/SpiderLing), a web crawler
  optimized for creating language corpora. Clever and sophisticated, but
  the documentation is on the lighter side, so getting it up and running
  might require some effort.

## Data analysis, machine learning and statistics

- [`pandas`](https://pandas.pydata.org/) as the workhorse library for
  manipulating tabular data, including some basic analyses and
  visualizations
- [`scikit-learn`](https://scikit-learn.org/) for training and applying
  machine learning models through a beautiful, unified API, and also
  [learning about machine learning](https://youtu.be/HC0J_SPm9co)
- [`statsmodels`](https://www.statsmodels.org/) for conducting
  statistical tests and statistical data exploration. This package is
  still evolving and you're of course still much more likely to find an
  obscure statistical procedure implemented in R than here, but it shows
  great promise.
- [`numpy`](https://numpy.org/) and
  [`scipy`](https://docs.scipy.org/doc/scipy/reference/tutorial/index.html):
  the foundational libraries most of the Python scientific computing
  ecosystem is built on. Whenever large quantities of numbers are
  manipulated in Python, it tends to be done using `numpy` objects for
  efficiency, so that's where to look if you encounter such operations
  and find them confusing. `scipy` adds numerical routines in various
  domains on top of that for convenience, e.g. statistical functions in
  [`scipy.stats`](https://docs.scipy.org/doc/scipy/reference/tutorial/stats.html).
  The documentation of these packages can be hard to navigate, a useful
  starting resource if you have time for a deep dive is
  <https://scipy-lectures.org/>.

## Data visualization

- [`altair`](https://altair-viz.github.io/) is a newer library which
  hopefully anticipates the future of data visualization in Python. It
  tries to provide an intuitive declarative API where you just tell
  Python what data you want to visualize, using which visual cues
  (points, lines, colors...), and Python figures out the how to make the
  plot informative and aesthetically pleasing.
- [`matplotlib`](https://matplotlib.org/), Python's traditional plotting
  library, battle-tested and versatile (lots of different output
  formats) but fairly low-level -- you often have to tweak plots
  manually
- [`seaborn`](https://seaborn.pydata.org/) builds on top of `matplotlib`
  by offering more appealing default visual styles and easy high-level
  functions for commonly used plot types

## Miscellaneous and advanced

- [`pendulum`](https://pendulum.eustace.io/) for easier handling of
  dates and times than with standard library
  [`datetime`](https://docs.python.org/3/library/datetime.html) module.
  (Dates and times across various locales and timezones are actually
  really tricky to get right, if you ever need to do so, I strongly
  advise you to use a library like this one to do the heavy lifting for
  you.)
- if you use the terminal, then [rich](https://rich.readthedocs.io/) can
  help you generate rich terminal output, including colors, tables,
  progress bars, and more
- larger projects often have a battery of
  [tests](https://en.wikipedia.org/wiki/Software_testing) which are run
  automatically to make sure that changes don't break the code. The
  easiest way to add tests to your code is via the standard library
  [`doctest`](https://docs.python.org/3/library/doctest.html) module,
  but if you find yourself needing a more featureful solution, I would
  suggest either [`pytest`](https://docs.pytest.org/), the current
  incumbent go-to solution in this space, or
  [`wardpy`](https://wardpy.com/), a challenger which appeared
  relatively recently but shows promise.
- [`poetry`](https://python-poetry.org/): larger projects also need to
  keep track of which (versions of) other packages they depend on, so
  that you can easily recreate the environment they need for running
  correctly when moving between computers. The traditional and somewhat
  barebones way of achieving this is via [`pip` and a `requirements.txt`
  file](https://pip.pypa.io/en/stable/user_guide/#requirements-files).
  `poetry` is a much more modern and convenient toolwhich will gently
  nudge you to adopt current best practices in this area.
- [`trio`](https://trio.readthedocs.io/) for asynchronous programming.
  If you don't know what that is and you don't care, that's perfectly
  fine. If you're at least a tiny bit curious, the `trio` docs will do a
  great job at teaching you -- seriously, they're probably the best
  technical documentation I've ever read -- and also show you how much
  thought and care goes into designing a polished library in a
  non-trivial domain.
- [`asks`](https://asks.readthedocs.io/) is a library which is inspired
  by `requests` but provides an asynchronous API using `trio`, which can
  make your program run faster if you're trying to fetch a lot of
  resources from various different servers

<!-- vim: set spell spelllang=en: -->
