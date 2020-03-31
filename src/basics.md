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

# A tour of Python and NLTK

# The most important piece of programming advice you'll ever get™

Over the course of this book, you'll be presented with a lot of
information. Like, *a lot*. It makes no sense trying to memorize all of
it on your first pass. No one expects you to. With programming as with
anything else, practice makes perfect -- as you keep using Python, the
parts you use often enough will gradually enter your muscle memory. The
parts that you don't, you'll have to look up as needed. I do that
constantly when I write code that uses other people's libraries that I
don't use every day.

Luckily, there's this thing called the internet, where you can search
for information using this thing called search engines, and these search
engines are pretty smart nowadays, so you can basically ask them "how do
I do X in Python" and they'll probably come up with links to reasonable
answers, because until you reach an intermediate to advanced level, you
can be pretty sure you're not the first person on the internet to have
that question. To help you make sense of the results that you're likely
to get, here's an overview of the domains that frequently appear in there:

- <https://stackoverflow.com/>, and subdomains of
  <https://stackexchange.com/>: in the programming community, these are
  leading sites offering information in a user-generated question/answer
  format. If you have a question, it's probably already been asked and
  answered there, maybe even multiple times. If it hasn't, go ask it!
- <https://docs.python.org/>: Python's official documentation, including
  the many modules included in the standard library
- subdomains of <https://readthedocs.io/>: documentation for additional
  packages, created by people all over the world; however, larger
  projects often host documentation on their own domain, e.g.
  <https://pandas.pydata.org/>
- <https://github.com>: this is a site many people use to collaborate on
  developing software projects in the open (cf. [open
  source](https://en.wikipedia.org/wiki/Open_source)). If you encounter
  weird behavior in a library, and that library's community uses GitHub
  for development, it's a good idea to check that library's [issue
  tracker](https://github.com/nltk/nltk/issues) to see whether that
  behavior might be a known
  [bug](https://en.wikipedia.org/wiki/Software_bug), and if not,
  consider reporting it yourself.

# Python notebooks: your fancy new calculator

Python notebooks are kind of like a calculator, just a lot more fancy
than your typical calculator. But otherwise, they should feel pretty
familiar -- you type some stuff in, press a button, Python thinks for a
while and spits back an answer.

The place where you type stuff is called a **cell**, and **running** a
cell with the play button (▶) makes Python **evaluate the code** you
typed in, i.e. your **program**. A very simple Python program could
consist of just one number:

```python
1
```

And Python's answer is, unsuprisingly, the same as a calculator's answer
would be: the **expression** `1` evaluates to... Well, it evaluates to
`1`. Unlike in a calculator though, you can have multiple cells in a
notebook, jump back and forth between them, edit and re-evaluate old
ones, etc. Let's create a new cell with the plus button (➕) and try
some slightly more complicated expressions.

```python
1 + 1
```

Cells can consist of multiple lines. Let's demonstrate that with a
**comment**. Comments are pieces of programs which are completely
ignored by the computer, they're included solely for the benefit of the
humans reading the code. In Python, the **syntax** for comments is to
write a hash mark; everything that follows after that is a comment,
which is often signaled by distinctive **syntax highlighting**.

```python
# This is a comment.
# Python will completely ignore this line, the one above and the one below.
# They're here just for you, as the person who reads this code.
3 - 2
```

If you'd like to write more extensive prose commentary, consider using
**Markdown** cells. In JupyterLab, use the notebook's top toolbar to
switch the cell type from *Code* to *Markdown*. Markdown is a
lightweight markup language which allows you to add formatting such as
*italics* and **bold**, [hyperlinks](https://www.markdowntutorial.com/)
and other features, but you don't have to worry about that, you can
mostly just write regular text and it'll probably render just fine. If
you'd like to learn more about Markdown features, you can always
double-click on cells like this one in JupyterLab to see their source
code, because they're written in Markdown, or try [this interactive
tutorial](https://www.markdowntutorial.com/). But let's focus on Python
right now.

The `*` operator is used for multiplication, `/` for division, `//` for
truncating division, `%` for modulo and `**` for exponentiation.

```python
2 * 3
```

```python
4 / 3
```

```python
# "truncating" division means it'll chop off the part of the number
# after the decimal point
4 // 3
```

```python
2**3
```

```python
# modulo wraps counting around a certain number, so you can use it e.g.
# for converting 24h clock hours to 12h clock hours
16 % 12
```

A decimal point, `.`, is used to separate the whole number part from the
fractional part of a number.

```python
0.1 + 0.1
```

At this point, if you're following along interactively in JupyterLab,
you're probably sick and tired of reaching for your mouse to press ▶ all
the time. JupyterLab has many handy keyboard shortcuts which I'll let
you discover on your own at your leisure, but the following three are
such a huge quality of life improvement that I feel compelled to point
them out:

- `Alt+Enter`: evaluate, insert new cell and switch to it
- `Shift+Enter`: evaluate and switch to next (existing) cell
- `Ctrl+Enter`: evaluate and stay at current cell

# Text as strings of characters

But enough about numbers! We're linguist, so let's look at how we can
represent text. The most basic way of representing text in Python is as
one long **string** of characters. Strings can be created using quotes,
both single and double work fine.

```python
"Hello, world!"
```

```python
'Hello, world!'
```

```python
"It's me, world!"
```

Though you can't just put a single quote inside a single-quote-delimited
string because, well, Python would think that's where the string ends.

```python tags=["raises-exception"]
'It's me, world!'
```

What Python spits out in this case is an **error traceback**, telling
you that something went wrong. Python usually gives extremely helpful
error messages that help you diagnose what went wrong, where the error
occurred and how you got there, so it's well worth spending time reading
them and learning to decipher them (it's not that hard, it just takes
practice). The one exception to this is when Python can't even parse
your program as valid Python code. In that case, the best it can do is
tell you where it got stuck, **raise** a `SyntaxError`, and leave you to
figure out what the problem is and how to fix it on your own. Which is
what happened here.

The easiest workaround when you want your string to contain one kind of
quote is to use the other kind of quote to delimit it, like we did in
the second-to-last code cell. Sometimes however, you want *both* kinds
of quotes. In that case, you can use the backslash character `\` to
**escape** the special, string-terminating meaning of a quote, and make
it into a regular character which is part of the string.

```python
"\"It's me, world!\" she said."
```

Escaping means canceling the default meaning of a character or character
sequence and using an alternative one. In a double-quoted string, `"`
normally means "end the string here", but a preceding `\` changes that
to "just insert a double quote at this point in the string". **Escape
sequences** exist to help you put characters in your strings which you
just can't put there literally, or which are hard to type on your
keyboard. For instance, you can't just put a **newline** character
inside a string:

```python tags=["raises-exception"]
"one line
another line"
```

Grr, another `SyntaxError`. What you *can* do is use the `\n` escape
sequence to represent that newline, without having an actual newline in
your source code and triggering that `SyntaxError`.

```python
"one line\nanother line"
```

How do you know that `\n` is really a newline if the string still just
shows `\n`? When you evaluate a string, Python shows you its canonical
representation which you could put back in your code. This means you get
a good idea of what the string contains -- the newline is otherwise a sort
of phantom character, as is most **whitespace**, but you can actually
*see* it here -- but it's not very pretty nor readable. If you want to
get a rendered version of your string, as it would appear in a text
file, you need to use the `print()` function.

```python
print("one line\nanother line")
```

Ah, much better. At least for reading. For inspecting the contents of
strings, the default behavior is in fact very useful.

There are various other [escape
sequences](https://docs.python.org/3/reference/lexical_analysis.html#string-and-bytes-literals)
you can use in Python strings, another handy and commonly encountered
one is `\t` for the tab character:

```python
print("one\ttwo\nthree\tfour")
```

And less commonly seen but pretty neat as well is `\N{...}`, for
inserting characters based on their [Unicode](unicode) names:

```python
"\N{see-no-evil monkey}"
```

If you want to type a longer piece of text into a Python string though,
that newline escape thing can become really annoying -- who wants to
type several paragraphs as one long line interspersed with `\n`s?
Fear not, **triple-quoted** strings to the rescue:

```python
"""one line
another line"""
```

```python
print('''one line
another line''')
```

Inside a triple-quoted or **multiline** string, you can put anything you
like, including actual newlines... except of course a sequence of three
quotes of the same type that you're using to delimit the string. In that
case, you need to escape at least some of them with that backslash
again.

All these various ways of creating strings are called string
**literals**. A literal is a dedicated syntax for creating one type of
data. In the previous section, we saw how to write down number literals
in Python -- the representation was so straightforward that we didn't
even think it needed a special term like 'literal' to describe it.
Python has a few more core, built-in data structures which have
dedicated literal syntax; we'll encounter them below.

# Objects and variables

Writing Python code consists of interacting with and manipulating
various **objects**. Object is a generic term for anything you can
inspect by putting it inside a code cell and evaluating that cell. So
far, we've seen numbers, strings and one **function** (that's right,
functions are objects too).

```python
print
```

If you know you'll be using an object repeatedly, it's a good idea to
store it in a **variable** using the **assignment operator**, `=`. That
way, you don't have to keep writing its literal over and over. The
variable name is entirely up to you, though there are some
[rules](https://docs.python.org/3/reference/lexical_analysis.html#identifiers)
you must abide by; for instance, you can't use spaces, so these are
often replaced with **underscores** `_`.

```python
string = "one\ttwo\nthree\tfour"
string
```

Anywhere you want to use that object, you can then refer to it using the
name of the variable that points to it.

```python
print(string)
```

Multiple names can refer to the same object.

```python
another_name = string
print(another_name)
```

Whether two names refer to the same object or not can be checked using
the `is` operator.

```python
string is another_name
```

```python
string is print
```

```python
string2 = "one\ttwo\nthree\tfour"
# NOTE: when not in the notebook environment, Python will usually be
# smart enough to figure out that string and string2 contain the same
# characters, it will store just one copy of the string to save
# memory and point both variables at it; in that case, the expression
# below will evaluate to True
string is string2
```

When two objects are not the same, they might still be **equal**, in
that they *look* the same, they have the same contents. You can check
for that using the **equality operator**, `==`.

```python
string == string2
```

A quick way to remember that using a real-world analogy: for twins, `is`
would be false, since they're two different people, but `==` would be
true, since they look the same.

The `==` is also a good opportunity to check that numbers and strings
really are two completely different things in Python:

```python
42 == "42"
```

# Attributes: objects on objects (on objects...)

Only rarely is an object [an island entire of
itself](https://web.cs.dal.ca/~johnston/poetry/island.html), most
objects have other objects attached to them as **attributes**, and these
in turn have attributes of their own, etc. We saw that the period
character `.` is used as the decimal separator in number literals. The
other, probably more important use of `.` in Python is for accessing
those attributes.

Say for instance that we have a [complex
number](https://en.wikipedia.org/wiki/Complex_number), which consists of
two parts, a *real* and an *imaginary* one. This is the literal syntax
for complex numbers in Python:

```python
c = 1 + 2j
c
```

Let's not worry about what complex numbers are good for right now, we're
interested in attributes. Complex numbers store their real and imaginary
parts as `.real` and `.imag` attributes, respectively.

```python
c.real
```

```python
c.imag
```

## Methods

Functions are regular objects and as such, they can also be attached to
other objects as attributes, as little snippets of dynamic behavior
which do something interesting with the parent object, instead of just
storing static data. Functions attached to an object as attributes are
more commonly referred to as that object's **methods**, but they're
basically just functions. For instance, inspect the the `print()`
function we already saw above, and compare it with the `.conjugate()`
method.

```python
print
```

```python
c.conjugate
```

Unlike regular data though, functions are generally not meant to be
inspected, they're meant to be **called** using function call syntax,
i.e. by appending `()` to the function name. Calling a function triggers
its behavior, it runs the piece of code that's associated with it. For
instance, the `print()` function prints objects to the screen, as we saw
previously. The `.conjugate()` method computes the complex number's
[conjugate](https://en.wikipedia.org/wiki/Complex_number#Conjugate).

```python
c.conjugate()
```

<!-- #md tags=["popout"] -->

Tab completion can actually complete more than just attributes, it also
covers variable names (just start typing the beginning and press `Tab`),
and filesystem paths inside strings.

<!-- #endmd -->

Let's drop complex numbers as the running example and come back to
strings -- they have a much greater variety of interesting methods we
can explore. If you're running this notebook interactively inside
JupyterLab, a great feature which helps you do so is **tab completion**.
If you type a variable name + `.` and hit the `Tab` key, a menu should
come up with all the attributes available on the object. Try it!

```python
# type string. and press Tab on your keyboard
```

```python tags=["hide_input", "output_scroll"]
# NOTE: this is a hack to show the tab completion list in the static
# version of the book
[a for a in dir(string) if not a.startswith("_")]
```

You can see there's quite a lot going on in there. There's a whole lot
of methods starting with the prefix `is*`, which are there to answer
some questions you might have about the contents of your strings.

```python
"cat".islower()
```

```python
"DOG".isupper()
```

```python
"Frank".istitle()
```

```python
"42".isnumeric()
```

If you'd like to learn more about an object, you can use JupyterLab's
**interactive help feature**. Type a question mark `?` before the name
of the object you're interested in, evaluate the cell, and detailed
information about that object will be shown. For instance, if we're
interested in what the `.isprintable()` method does:

```python
?string.isprintable
```

```python tags=["hide_input", "output_scroll"]
# NOTE: and this is a hack to show interactive help outputs in the
# static version of the book
def print_help(obj, **kwargs):
    print(get_ipython().inspector._get_info(obj, **kwargs)["text/plain"])

print_help(string.isprintable)
```

<!-- #md tags=["popout"] -->

To be completely accurate, the question mark interactive help feature,
as well as some other extensions to Python syntax we'll come across, are
implemented by the [IPython](https://ipython.org/) library, which
JupyterLab notebooks use to communicate with Python. If you ever end up
using Python at the [command
line](https://en.wikipedia.org/wiki/Command-line_interface), then these
features are also available inside the IPython
[REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop),
which you can start with the `ipython` command (if installed).

<!-- #endmd -->

**The question mark is not regular Python syntax**, it only works inside
notebooks and is intended to make interactive exploration easier. Stock
Python also has a built-in `help()` function which does something
similar, but it displays less information. If you want even more
details, you can insist by typing two question marks `??` instead of
one:

```python
??string.isprintable
```

```python tags=["hide_input", "output_scroll"]
print_help(string.isprintable, detail_level=1)
```

For convenience, the question mark(s) can also go behind the object
you're taking a peek at.

```python
string.isprintable?
```

And another way to trigger interactive help is by pressing `Shift-Tab`
while your typing cursor is inside an object's name. A floating window
will pop up with the help contents inside. This is useful for quick
checks, because you don't even have to evaluate the cell.

```python tags=["hide_input", "output_scroll"]
print_help(string.isprintable)
```

There are also several methods which allow you to create new strings
with some of the characters changed.

```python
# convert to upper case
"klein".upper()
```

```python
# convert to lower case
"GROß".lower()
```

```python
# convert to lower case in an even more aggressive way, which is usually
# the safer option if you really want to make sure all case distinctions
# are ignored
"GROß".casefold()
```

```python
"pride and prejudice".capitalize()
```

```python
"pride and prejudice".title()
```

```python
# remove leading and trailing whitespace
"""

                       floating in space

""".strip()
```

Some of these methods even require additional arguments to do their
work. For instance, if you want to `.replace()` part(s) of the string
with something else, you need to tell Python what to replace with what.
Arguments are written out between the parentheses doing the function
call, and if you can't remember what they are or what order they come
in, that's precisely what interactive help is there for!

```python
"I love cats and categories.".replace("cat", "dog")
```

Note that **none of these methods modify the original string**, they
just use it to derive what the new string should look like.

```python
animal = "cat"
animal.upper()
```

```python
animal
```

This is because strings (and numbers) in Python are **immutable** -- you
can't change them in place. You can create new strings and re-assign
them to old variable names, but the old strings will always stay the way
they were at the beginning.

```python
# create a string and give it two names
name1 = "string"
name2 = name1
```

```python
# create a new string which is an uppercase version of the original
# string, and re-assign it to the name2 variable
name2 = name2.upper()
name2
```

```python
# but the old string is still there, undisturbed
name1
```

We'll talk more about immutability in the next section about
**collections**, because unlike strings and numbers, some Python objects
*can* actually be modified in place.

Using tab completion and interactive help (`?` or `Shift-Tab`), I
encourage you to familiarize yourself with the methods on string
objects, or indeed on any new object type that you come across and
intend to use, so that you know what's available and get a picture of
what you can use the object for. No need to go through them
exhaustively, just skim the list, read the descriptions of some of the
methods that sound particularly useful, leave those that sound confusing
for later (or never).

# Collections

go back to strings, split, indexing, plus, in, len

collections -> len -> also works on strings ~ collections of characters,
or more precisely, of strings of length 1

functions at the end, showing that any code can be wrapped for reuse

built-in functions (type, str, int, float, ...)
[List of built-in functions](https://docs.python.org/3/library/functions.html)


# Importing

also installing with pip? `!pip install ... `

```python
import json
```

```python
json
```

```python
json.loads
```

```python
from json import loads
```

```python
loads
```

```python
from builtins import set
```

```python
from json import *
```

```python
import json
```

```python
import json as js
```

```python
js.loads
```

<!-- vim: set spell spelllang=en: -->
