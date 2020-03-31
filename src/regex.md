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

# Regular expressions

> Some people, when confronted with a problem, think “I know, I'll use
> regular expressions.” Now they have two problems.
>
> -- http://regex.info/blog/2006-09-15/247

# Basic orientation

Regular expressions are a powerful tool to slice and dice text, extract
parts of it, replace them etc. They're also another language of their
own, completely separate from Python and fairly terse, which comes with
a steep learning curve for anything but the most trivial tasks. And it
doesn't help that you basically have to embed your regular expression
"programs" inside Python programs, writing them inside Python strings,
which means you have no syntax highlighting to help you and introduces
some additional gotchas we'll cover below.

<!-- #md tags=["popout"] -->

The one exception to this suggestion is the [last
section](#Identifying-graphemes): if you're interested in splitting a
text into graphemes (e.g. for counting them), the only way to do so
involves a regular expression, luckily fairly simple.

<!-- #endmd -->

Long story short, regular expressions are powerful but not exactly easy.
If you don't know them already, I would suggest not trying to learning
them at the same time that you're trying to get to grips with Python.
Just skim this chapter to have a rough idea of what's possible, and come
back to it once you're more comfortable with Python and have some free
cognitive capacity for another challenge. A good introductory text on
regular expressions in the context of Python is the official [*Regular
Expression
HOWTO*](https://docs.python.org/3/howto/regex.html#regex-howto).

If on the other hand you already have some background in regular
expressions, this chapter will try to give you the key information on
how to use them effectively in Python. Unlike in Perl or Ruby, regular
expressions in Python aren't built into the language, they have no
special syntax -- they're implemented as plain libraries. There are
currently two popular choices:

- the [`re` module](https://docs.python.org/3/library/re.html), which is
  part of the standard library and so it's always available without
  needing to install anything
- the [`regex` module](https://pypi.org/project/regex/), which you need
  to install separately, but it has more features, better Unicode
  support, etc.

I personally recommend using `regex` and renaming it to `re` when
importing, because this is a) shorter and b) it makes it easy to switch
your code to using the `re` library if `regex` is not available. You can
do that because `regex` exposes the same
[API](https://en.wikipedia.org/wiki/Application_programming_interface)
(Application Programming Interface) as `re`. Basically, this means that
using both `regex` and `re` "looks the same" -- the function names are
the same, they accept the same parameters, etc.

```python
import regex as re
```

Since the API is the same, the `regex` module does not have its own
extensive documentation -- the idea is that you will refer to the
[documentation of the `re`
module](https://docs.python.org/3/library/re.html) for general
information on how to use regular expressions in Python, and only look
at the [documentation of the `regex`
module](https://pypi.org/project/regex/) when you need to learn about
the specifics of some additional feature.

# Quick overview of regex syntax

A quick overview of regular expression syntax accepted by the `regex`
library, borrowed from [chapter 3 of the NLTK
Book](http://www.nltk.org/book/ch03.html) and extended:

| syntax        | description |
|---------------|:------------|
| `.`           | Wildcard, matches any character|
| `\w   \W`     | Matches any (non-)word character (careful, the computer's idea about what a word character is might be different from yours)|
| `\d   \D`     | Matches any (non-)digit character|
| `\s   \S`     | Matches any (non-)space character|
| `\p{...}`     | Matches any character with Unicode property ...|
| `\P{...}`     | Matches any character without Unicode property ...|
| `\X`          | Matches a Unicode extended grapheme cluster (cf. end of chapter)|
| `^abc`        | Matches some pattern abc at the start of a string (or line, if the multiline flag is enabled)|
| `abc$`        | Matches some pattern abc at the end of a string (or line, if the multiline flag is enabled)|
| `\babc\b`     | Matches some pattern `abc` surrounded by word boundaries|
| `\Babc\B`     | Matches some pattern `abc` not surrounded by word boundaries|
| `[abc]`       | Matches one of a set of characters|
| `[^abc]`      | Matches any character which is NOT in the set|
| `[A-Z0-9]`    | Matches one of a range of characters|
| `ed\|ing\|s`  | Matches one of the specified strings (disjunction)|
| `*`           | Zero or more of previous item, e.g. `a*`, `[a-z]*` (also known as Kleene Closure); greedy (match as many as possible)|
| `*?`          | The same as `*`, but non-greedy (match as few as possible)|
| `+`           | One or more of previous item, e.g. `a+`, `[a-z]+`; greedy|
| `+?`          | The same as `+` but non-greedy|
| `?`           | Zero or one of the previous item (i.e. optional), e.g. `a?`, `[a-z]?`|
| `{n}`         | Exactly n repeats where n is a non-negative integer|
| `{n,}`        | At least n repeats|
| `{,n}`        | No more than n repeats|
| `{m,n}`       | At least m and no more than n repeats|
| `a(b\|c)+`    | Parentheses indicate the scope of the operators and capture the corresponding groups of characters, which are then accessible accessible with the `match.group()` or `match.groups()` method, or with a backreference: `\1`, `\2` etc., depending on the order of the groups|
| `a(?:b\|c)+`  | Non-capturing version of the parentheses|

# Interactive exercises

The following cell defines a function for creating interactive widgets
in which you can play around with regular expressions. Don't worry, you
are not expected to understand this code, but if you're curious, you can
poke around and use it to implement your own interactive widgets inside
Jupyter notebooks.

```python
import IPython.core.display as ipd
import ipywidgets as ipw

def findall(dotall=False, multiline=False, ignorecase=False, only_first=False, regex="", string=""):
    flags = 0
    if dotall:
        flags |= re.DOTALL
    if multiline:
        flags |= re.MULTILINE
    if ignorecase:
        flags |= re.IGNORECASE
    start = '<span style="background-color: gold">'
    end = "</span>"
    offset_bump = len(start) + len(end)
    offset = 0
    html = string
    matches = []
    if regex:
        try:
            for m in re.finditer(regex, string, flags):
                matches.append(m.captures()[0])
                span = m.span()
                sstart, send = span[0] + offset, span[1] + offset
                html = html[:sstart] + start + html[sstart:send] + end + html[send:]
                offset += offset_bump
                if only_first:
                    break
        except:
            pass
    ipd.display(ipd.HTML("<p>REGEX: <strong>" + regex + "</strong></p><p><pre>" + html + "</pre></p>"))
    return matches

def interactive_findall(string):
    ipw.interact(findall, string=ipw.fixed(string))
```

Let's define a few strings to play around with using regular
expressions:

<!-- TODO: change the example strings? I seem to remember I originally -->
<!-- borrowed these from the NLTK Book. -->

```python
MARY = """Mary had a little lamb.
And everywhere that Mary
went, the lamb was sure
to go."""

SPECIAL = "Special characters must be escaped in order to be matched literally.*"

PETS = "The pet store sold cats, dogs, and birds."

FIRST = "=first first= # =second second= # =first= # =second="

QUANT1 = """Match with zero in the middle: @@
Subexpresion occurs, but...: @=#=ABC@
Lots of occurrences: @=#==#==#==#==#=@
Must repeat entire pattern: @=#==#=#==#=@"""

QUANT2 = """AAAD
ABBBBCD
BBBCD
ABCCD
AAABBBC"""

QUANT3 = """aaaaa bbbbb ccccc
aaa bbb ccc
aaaaa bbbbbbbbbbbbbb ccccc"""

BACK = """jkl abc xyz
jkl xyz abc
jkl abc abc
jkl xyz xyz"""

LAZY = """-- I want to match the words that start
-- with 'th' and end with 's'.
this
thus
thistle
this line matches too much
"""
```

Evaluate the following cells and use the widgets to highlight parts of
the string using regular expressions. Suggestions for regular
expressions to try out are listed in the comments for each cell.

**NOTE:** These interactive widgets **do not** work in the static
version of the book hosted at <https://v4py.github.io>, you need to run
the notebook in JupyterLab to use them. If you don't see an interactive
widget after evaluating the cells below, you probably don't have the
JupyterLab widgets extension installed. At the time of writing, this is
done via the following command:

~~~sh
jupyter labextension install @jupyter-widgets/jupyterlab-manager
~~~

Alternatively, you can check out the [`ipywidgets` installation
instructions](https://ipywidgets.readthedocs.io/en/latest/user_install.html).

```python
#   .a
#   [a-z]a
interactive_findall(MARY)
```

```python
#   .*
#   \.\*
interactive_findall(SPECIAL)
```

```python
#   cat|dog|bird
interactive_findall(PETS)
```

```python
#   =first|second=
#   =(first|second)=
interactive_findall(FIRST)
```

```python
#   @(=#=)*@
interactive_findall(QUANT1)
```

```python
#   A+B*C?D
interactive_findall(QUANT2)
```

```python
#   a{,4}
interactive_findall(QUANT3)
```

```python
#   (abc|xyz) \1
interactive_findall(BACK)
```

```python
#   \bth\p{Alphabetic}*s\b
interactive_findall(LAZY)
```

`\p{Alphabetic}` is the most inclusive way to express the concept of
"something like a letter" within Unicode. `\p{Letter}` exists as well,
but it's a less comprehensive category. For a good overview of Unicode
character properties and categories in the context of regular
expressions, see
[here](https://www.regular-expressions.info/unicode.html).

# Using regular expressions in Python

We've mentioned that writing regular expressions is like writing little
programs in a different programming language *inside* Python strings,
and that one of the drawbacks is that you don't get syntax highlighting
to help you. The other drawback is that by default, Python doesn't take
string literals... literally, but replaces *escape sequences* starting
with a backslash with something else. This is a cool feature when you're
trying to put a tab or newline inside a string, or some Unicode
character that you can't directly type on your keyboard but happen to
know its codepoint value or name.

```python
"a\tb"
```

```python
print("a\tb")
```

```python
"\U0001f600"
```

```python
"\N{SMILING FACE WITH OPEN MOUTH AND COLD SWEAT}"
```

It's emphatically *not* a cool feature if what you're trying to do is
write a regular expression inside that string which relies on all those
backslashes and curly braces staying where you put them, and Python
steals them from under you. And as you've seen above, regular
expression syntax tends to use backslashes and curly braces *a lot*.

Fortunately, Python has a feature called *raw string literals*. These
are string literals prefixed with a `r`, and what that does is turn all
of these magic escape sequencs off. Which makes writing regular
expressions a whole lot easier.

```python
r"\n"
```

```python
print(r"\n")
```

So rule number 1 of regular expressions in Python: **always write
regular expressions inside raw strings**, even if it's something as
innocuous as `r".*"`, which doesn't even contain a backslash. A classic
thing with regular expressions is that they grow more complex over time
as edge cases are discovered and those backslashes worm their way in
there. When that happens, you'll thank me that your regex string already
is a raw string and your code still works instead of breaking in
unexpected and hard to debug ways.

With that out of the way, let's explore the Python regular expression
API. As mentioned previously, we'll be using the external regex library,
but the API is the same as the standard library `re` module, so that's
where you should look for [further
information](https://docs.python.org/3/library/re.html).

```python
import regex as re
```

The `match()` function matches a regular expression at the beginning of
a string, and returns a `Match` object if a match is found, otherwise
`None`.

```python
re.match(r"foo", "foo bar baz")
```

The result of `match()` can be used in conditionals -- `Match` objects
are truthy and `None` is falsey, so everything works as expected.

```python
if re.match(r"foo", "foo bar baz"):
    print("It matches!")
```

```python
if re.match(r"qux", "foo bar baz"):
    print("It matches!")
```

The `Match` object's attributes allow you to explore the specifics of
the match.

```python
m = re.match(r"foo", "foo bar baz")
```

```python
m.start()
```

```python
m.end()
```

```python
m.group()
```

```python
s = "foo bar baz"
```

```python
s[m.start():m.end()]
```

If the regular expressions contains **capturing groups**, their captured
values can be accessed via the `.group()` method.

```python
m = re.match(r"(f)o(o)", "foo bar baz")
```

```python
m
```

```python
m.group()
```

```python
m.group(1)
```

```python
m.group(2)
```

```python
m.groups()
```

```python
m.span()
```

The `fullmatch()` function requires that the provided regular expression
pattern matches the *entire* string -- it's stricter than just `match`.

```python
re.fullmatch(r"foo", "foo bar baz")
```

```python
re.fullmatch(r"foo.*", "foo bar baz")
```

Conversely, the `search()` function is more lenient -- it searches for a
match anywhere within the string.

```python
re.match(r"bar", "foo bar baz")
```

```python
re.search(r"bar", "foo bar baz")
```

`findall()` finds all matches and returns a list of the matching
substrings.

```python
re.findall(r"foo", "foo bar baz foo")
```

If there are potentially many matches, or if you need to do some more
fancy stuff which involves manipulating `Match` objects, you should
consider using `finditer()` instead, which returns an iterator over
`Match` objects. This avoids building a list of all the matches and
storing all of it at once in memory.

```python
re.finditer(r"s.", "My father likes cars.")
```

```python
for m in re.finditer(r"s.", "My father likes cars."):
    print(m)
```

```python
for m in re.finditer(r"s.", "My father likes cars."):
    print(m.group())
    print(m.span())
```

The `sub()` function performs substitutions.

```python
re.sub(r"cat|like", r"dog", "I like cats and categories.")
```

By default, all occurrences are substituted, but you can change this via
the `count=` parameter.

```python
re.sub(r"cat|like", r"dog", "I like cats and categories.", count=1)
```

Note that the substitution string (the second argument) is *also* a
regular expression pattern, it can contain backreferences to matched
capture groups. The syntax for backreferences involves -- you guessed it
-- backslashes, so you should make that second argument a raw string
too, for good measure.

```python
re.sub(
    r"(cat|like)",
    r"dog\1",
    "I like cats and categories"
)
```

The way matching is performed can by modified by passing **flags**.
These are documented
[here](https://docs.python.org/3/howto/regex.html#compilation-flags). We
may e.g. want to ignore case differences.

```python
re.match(r"a.", "ASDF")
```

One would expect that the way to do this would be by passing an
`ignore_case=` argument. Unfortunately, the API for this is somewhat
clunky for historical reasons, it's inspired by more low-level languages
than Python, so instead, you have to pass the special `re.IGNORECASE`
value to the `flags=` argument.

```python
re.match(r"a.", "ASDF", flags=re.IGNORECASE)
```

Where this gets especially weird is when you need to combine multiple
flags -- it's done via `|`, the *bitwise or* operator.

```python
re.match(r"a.", "A\nDF", flags=re.IGNORECASE)
```

```python
re.match(
    r"a.",
    "A\nDF",
    flags=re.IGNORECASE | re.DOTALL
)
```

This works because `re.IGNORECASE` and `re.DOTALL` are actually numbers
whose binary representation is all zeros except one `1` in one place,
different for each flag. By looking at where that `1` is, the `regex`
module can figure out which flag has been set.

```python
print(re.IGNORECASE)
print(re.DOTALL)
```

```python
print(f"{re.IGNORECASE:08b}  IGNORECASE")
print(f"{re.DOTALL:08b}  DOTALL")
```

Doing a bitwise or with `|` combines the `1`'s from both numbers.

```python
combined = re.IGNORECASE | re.DOTALL
# the part after : is a format specifier -- 08 says to left-pad with
# 0's to a total width of 8 characters, b says to print the number in
# binary; find out more about format specifiers at https://pyformat.info/
print(f"  {re.IGNORECASE:08b}  IGNORECASE")
print(f"| {re.DOTALL:08b} DOTALL")
print("-" * 10)
print(f"  {combined:08b}")
```

Looking at the bits, it's immediately clear which two flags we've
combined. Looking at the decimal representation, if you squint, the
bitwise or kind of looks like an addition which prevents the same flag
from being added twice.

```python
print(f"  {re.IGNORECASE:2}  IGNORECASE")
print(f"| {re.DOTALL:2}  DOTALL")
print("-" * 4)
print(f"  {re.DOTALL | re.IGNORECASE:2}")
print()
print(f"  {re.IGNORECASE:2}  IGNORECASE")
print(f"| {re.DOTALL:2}  DOTALL")
print(f"| {re.DOTALL:2}  DOTALL")
print("-" * 4)
print(f'  {re.DOTALL | re.IGNORECASE:2} (even though DOTALL was "added" twice)')
```

This property is a result both of how bitwise or works -- it performs an
or operation for each pair of bits at the same position in both numbers
-- and of the fact that the flag numbers are constructed to be all zeros
and one `1` in a different position for each flag.

```python
combined
```

# Identifying graphemes

One super useful use of regular expressions from a linguistic
perspective is counting the number of **extended grapheme clusters** (~
graphemes) in a string.

```python
pronunciation_of_three_in_czech = "tr̝̥i"
```

```python
len(pronunciation_of_three_in_czech)
```

```python
list(pronunciation_of_three_in_czech)
```

Diacritics are separate Unicode characters, which doesn't correspond to
our intuitive notion of how many "letters" (graphemes) the string
consists of. Regular expressions to the rescue:

```python
re.findall(r"\X", pronunciation_of_three_in_czech)
```

```python
len(re.findall(r"\X", pronunciation_of_three_in_czech))
```

`\X` is one of those regular expression features that is not available
in the standard `re` module.
