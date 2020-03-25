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

## Books

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
stuff in NLP, treating the tools as black boxes, but rather focuses on
understanding algorithms and concepts and improving your programming
skills. This means that it often spends time on less cutting-edge
methods, which are however conceptually simpler and thus have better
teaching value. Depending on what your immediate needs are, this may be
a strength or a weakness, but in the long run, I would argue that every
programming linguist should spend some time honing their programming
skills instead of always blindly following how-to style recipes, because
even copy-pasting black box code can go seriously wrong if you don't
have a larger picture of what's going on.

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

## Videos

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

<!-- VanderPlas: statistics ________________________________________ -->

<!-- #md tags=["popout"] -->

If you're interested in using Python for data analysis, I can recommend
anything by Jake VanderPlas. This particular talk may be titled
*Statistics for Hackers*, but in reality it's geared towards anyone with
a keen mind who's interested in statistics but hasn't had extensive
formal training in math, which means they sometimes struggle with a
formula-heavy approach. Which often applies to linguists, including
myself.

<!-- #endmd -->

<!-- #md -->
<iframe width="560" height="315"
  src="https://www.youtube-nocookie.com/embed/Iq9DzN6mvYA" frameborder="0"
  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
  allowfullscreen>
</iframe>
<!-- #endmd -->

<!-- VanderPlas: visualization _____________________________________ -->

<!-- #md tags=["popout"] -->

Good visualization is a key part of any data analysis, and we've
previously established that Jake VanderPlas has interesting and useful
things to say about data analysis in Python, so let's listen to him on
the subject of visualization!

<!-- #endmd -->

<!-- #md -->
<iframe width="560" height="315"
  src="https://www.youtube-nocookie.com/embed/vTingdk_pVM" frameborder="0"
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

<!-- _______________________________________________________________ -->

---

And finally, here are a few more advanced talks which I heartily
recommend watching after you've spent a little more time with Python:

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

## Libraries

- nltk
- corpy
- lxml
- trio
- regex (use re docs)
- matplotlib
- seaborn
- pandas

<!-- vim: set spell spelllang=en: -->
