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

# Make the most of Python Jupyter notebooks

Python-based [Jupyter](http://jupyter.org/) notebooks mostly consist of
Python code, obviously, and some Markdown text. But they also offer some
very handy functions and shortcuts which are not available in Python
itself, and which are really helpful for interactive work. This is my
personal best of / reference.

The shortcuts fall into two groups:

- **magics**: special functions with special syntax whose names start
  with `%` (in which case they apply to the rest of the line → "line
  magics") or `%%` (in which case they apply to the entire cell → "cell
  magics")
- **command line programs**: if you know how to use command line
  programs, you can do so directly from the notebook by prefixing the
  command line invocation with `!`

<!-- #md tags=["popout"] -->

**REPL** stands for [read--eval--print
loop](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop).

<!-- #endmd -->

**NB:** Most of the following also applies to the [IPython
REPL](https://ipython.org/), which you can run in your terminal instead
of the regular Python REPL for a more comfortable interactive coding
experience.

# Magics

The syntax of magic functions is modeled after the syntax of command
line programs:

- to call them, just write their name and evaluate the cell, without any
  parentheses (unlike regular Python functions, which are called like
  this: `function()`)
- arguments are separated just by whitespace (in Python, there are
  commas: `function(arg1, arg)`)
- some have optional arguments (**options**) which tweak their behavior:
  these are formed by a hyphen and a letter, e.g. `-r`

## Getting help

You can read more about the magic function system by calling the
`%magic` magic:

```python
%magic
```

`%quickref` brings up a useful cheat sheet of special functionality:

```python
%quickref
```

If you want more information about an object, `%pinfo` and `%pinfo2` are
your friends:

```python
def foo():
    "This foo function returns bar."
    return "bar"
```

```python
# shows the object's docstring
%pinfo foo
```

```python
# shows the full source code
%pinfo2 foo
```

These are so handy that they have their own special syntax: `?` and
`??`, placed either before or after the object's name:

```python
?foo
```

```python
foo?
```

```python
??foo
```

```python
foo??
```

Of course, this also works with magic functions:

```python
?%pylab
```

You can also open a documentation popup by pressing `Shift+Tab` with
your cursor placed in or after a variable name. Repeating the command
cycles through different levels of detail.

## Manipulating objects

The appeal of an interactive environment like Jupyter is that you can
inspect any object you're working with by just evaluating it:

```python
foo = 1
```

```python
foo
```

`%who` and `%whos` will show you all the objects you've defined:

```python
%who
```

```python
%whos
```

Sometimes though, these objects are large and you don't want to litter
your notebook with tons of output you'll delete right afterwards. (Also,
if you forget to delete it, your notebook might get [too large to
save](https://github.com/jupyter/notebook/issues/650).) That's when you
need to use the Jupyter pager, which lets you inspect an object in a
separate window.

```python
foo = "This is a line of text.\n" * 1000
```

```python
%page foo
```

By default, the pager pretty-prints objects using the `pprint()`
function from the `pprint` module. This is handy for collections,
because it nicely shows the nesting hierarchy, but not so much for
strings, because special characters like newlines `\n` are shown as
escape sequences. If you want the string to look like it would if it
were a text file, pass the `-r` option ("raw") to page through the
result of calling `str()` on the object instead:

```python
%page -r foo
```

If you want to inspect the source code of a module, use `%pfile` on the
object representing that module, or an object imported from that module:

```python
import os
from random import choice
```

```python
%pfile os
```

```python
%pfile choice
```

Sometimes, you create an object which you know you will want to reuse in
a different session or maybe in a completely different notebook. A
lightweight way to achieve this is using the `%store` magic:

```python
%store foo
```

You can list the values stored in your database by invoking `%store`
without arguments:

```python
%store
```

To restore a variable from the database into your current Python
process, use the `-r` option:

```python
# restores only `foo`
%store -r foo
```

```python
# restores all variables in the database
%store -r
```

And this is how you clear no longer needed variables from storage:

```python
# removes `foo`
%store -d foo
```

```python
# removes all variables
%store -z
```

```python
%store
```

### Working with the file system

`%ls` lists files in the directory where your notebook is stored:

```python
%ls
```

If you provide a path as argument, it lists that directory instead:

```python
%ls ~/.files
```

If you provide a [glob
pattern](https://en.wikipedia.org/wiki/Glob_%28programming%29), then
only files that match it are listed:

```python
%ls ~/.files/*rc
```

`%ll` ("long listing") formats the listing as one entry per line with
columns providing additional information:

```python
%ll ~/.files
```

One of those columns indicates file size, which is great, but they're in
bytes, which is less great (hard to read at a glance). The `-h` option
makes the file sizes print in human-readable format:

```python
%ll -h ../images/outro
```

`%%writefile` writes the contents of a cell to a file:

```python
%%writefile foo.py

def foo():
    "This foo function returns bar."
    return "bar"
```

`%cat` prints the contents of a file into the notebook:

```python
%cat foo.py
```

`%cat` is called `%cat` because it can also con**cat**enate multiple
files (or the same file, multiple times):

```python
%cat foo.py foo.py
```

The output of `%cat` can be saved into a file with `>` (if the file
exists, it's overwritten):

```python
%cat foo.py foo.py >3foos.py
```

```python
%cat 3foos.py
```

Hey! Our `3foos.py` is one foo short. Let's add it by **appending** to
the file with `>>`:

```python
%cat foo.py >>3foos.py
```

```python
%cat 3foos.py
```

There, much better.

`%less` opens a file in the pager (with nice syntax highlighting if it's
a Python source file):

```python
%less foo.py
```

`%less` is named after the program `less`, which is used to page through
text files at the command line. Why is the original `less` called
"less"? Because an earlier pager program was called `more` (as in "show
me *more* of this text file"), and as the saying goes, "less is more".

(Programmers are fond of dad jokes. I like how this one works on
multiple levels -- the literal meaning that `less`-the-program is
intended to replace `more`-the-program interacts with the figurative
meaning that having less is better than having more, and both coalesce
into "use `less` because it's better than `more`".)

`%cat` and `%ls` are also named after corresponding command line
programs.

## Finding out more about your code

When developing, code often behaves differently from what you intended
when you wrote it. The following tools might help you find out why.

Timing the execution of a piece of code will help you determine if it's
slowing you down. The `%timeit` magic has your back, it runs your code
repeatedly and thus provides more reliable estimates. It comes in both
line and cell variants.

```python
%timeit sorted(range(1_000_000))
```

```python
%%timeit
lst = list(range(1_000_000))
sorted(lst)
```

The cell variant can include initialization code on the first line,
which is run only once:

```python
%%timeit lst = list(range(1_000_000))
sorted(lst)
```

If you have the
[memory\_profiler](https://github.com/pythonprofilers/memory_profiler)
library installed, you can load its magic extension and use `%memit` in
the same way as `%timeit` to get a notion of how much memory your code
is consuming.

```python
%load_ext memory_profiler
```

```python
%memit list(range(1_000_000))
```

*Peak memory* is the highest total amount of memory the Python process
used when your code ran. *Increment* is peak memory minus the amount of
memory Python used *before* your code ran.

```python
%%memit
lst = list(range(1_000_000))
even = [i for i in lst if i % 2 == 0]
```

```python
%%memit lst = list(range(1_000_000))
even = [i for i in lst if i % 2 == 0]
```

If you have a more involved piece of code where multiple functions are
called, you may need more granular information about running times than
that provided by `%timeit`. In that case, you can resort to
**profiling** using the `%prun` magic. Profiling tells you how fast
different parts of your code run relative to each other, in other words,
where your bottlenecks are.

```python
import time

def really_slow():
    time.sleep(1)

def fast():
    pass

def only_slow_because_it_calls_another_slow_function():
    fast()
    really_slow()
```

```python
%prun only_slow_because_it_calls_another_slow_function()
```

The results show up in the pager, here's a copy:

```
         7 function calls in 1.001 seconds

   Ordered by: internal time

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    1.001    1.001    1.001    1.001 {built-in method time.sleep}
        1    0.000    0.000    1.001    1.001 {built-in method builtins.exec}
        1    0.000    0.000    1.001    1.001 <ipython-input-81-8d3b1f67a0d9>:3(really_slow)
        1    0.000    0.000    1.001    1.001 <ipython-input-81-8d3b1f67a0d9>:9(only_slow_because_it_calls_another_slow_function)
        1    0.000    0.000    1.001    1.001 <string>:1(<module>)
        1    0.000    0.000    0.000    0.000 <ipython-input-81-8d3b1f67a0d9>:6(fast)
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
```

`%prun` also has a cell variant:

```python
%%prun
really_slow()
fast()
```

```
         6 function calls in 1.001 seconds

   Ordered by: internal time

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    1.001    1.001    1.001    1.001 {built-in method time.sleep}
        1    0.000    0.000    1.001    1.001 {built-in method builtins.exec}
        1    0.000    0.000    1.001    1.001 <string>:2(<module>)
        1    0.000    0.000    1.001    1.001 <ipython-input-81-8d3b1f67a0d9>:3(really_slow)
        1    0.000    0.000    0.000    0.000 <ipython-input-81-8d3b1f67a0d9>:6(fast)
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
```

Perhaps the most useful magic for development is `%debug`, which allows
you to pause the execution of a piece of code, examine the variables
which are defined at that moment in time, resume execution fully or
step-by-step etc. You can either pass a statement that you want to debug
as argument:

```python
def foo():
    for i in range(10):
        print("printing", i)
```

```python
%debug foo()
```

Or you can invoke plain `%debug` after an exception has been raised to
jump directly to the place where the error occurred, so that you can
figure out why things went wrong:

```python
def foo():
    dct = dict(foo=1)
    return dct["bar"]
```

```python
foo()
```

```python
%debug
```

If you want to pause one of your functions and explore its state at a
particular point, set a *breakpoint* using the `set_trace()` function
from the `IPython.core.debugger` module. The debugger will be
automatically invoked when the call to `set_trace()` is reached during
execution:

```python
from IPython.core.debugger import set_trace

def foo():
    for i in range(2):
        set_trace()
        print("printing", i)
```

```python
foo()
```

The Python debugger is called `pdb` and it has some special commands of
its own which allow you to step through the execution. They can be
listed by typing `help` at the debugger prompt (see above), or you can
have a look at the
[documentation](https://docs.python.org/3/library/pdb.html#debugger-commands).
The examples above also illustrate what a typical debugging session
looks like (stepping through the program, inspecting variables). When
you want to stop debugging, don't forget to **quit the debugger** with
`quit` (or just `q`) at the debugger prompt, or else your Python process
will become unresponsive.

## Plotting

Jupyter is tightly integrated with the
[matplotlib](https://matplotlib.org/) plotting library. Plotting is
enabled by running the `%matplotlib` magic with an argument specifying
how the notebook should handle graphical output. `%matplotlib notebook`
will generate an interactive plot which you can resize, pan, zoom and
more. A word of caution though: when using this variant, once you're
**done with the plot**, don't forget to **"freeze" it using the ⏻
symbol** in the upper right corner, or else subsequent plotting commands
from different cells will all draw into this same plot.

```python
%matplotlib notebook
```

```python
import matplotlib.pyplot as plt
```

```python
plt.plot(range(10))
```

By contrast, `%matplotlib inline` will just show a basic plot with a
default size:

```python
%matplotlib inline
```

```python
plt.plot(range(10))
```

For more information on plotting with matplotlib, see their [usage
guide](https://matplotlib.org/2.1.1/tutorials/introductory/usage.html).

# Command line programs

The operations listed in the section on magics for working with the file
system can of course also be achieved using the corresponding command
line programs, so if you know those, no need to memorize the magics. In
fact, the magics are often just thin wrappers around the command line
programs, which is why they are named the same.

```python
!ls --color -hArtl ~/.files
```

The only functionality that I miss among the magics is the ability to
take a quick look at part of a possibly very large text file. This can
be done with the `head` command line program, which prints the beginning
of a file:

```python
!head ../intro.*
```

The `-n` option controls how many lines from the beginning of the file
should be printed:

```python
!head -n3 ../intro.* ../outro.*
```

Similarly, the `tail` program prints endings of files:

```python
!tail -n5 ../intro.*
```

Another useful feature of command line execution is that instead of
*printing* the result, you can have it *returned* as a list of strings
corresponding to lines of output. Either by prepending two exclamation
marks instead of one:

```python
!!tail -n5 ../intro.*
```

Or by assigning the expression to a variable:

```python
out = !tail -n5 ../intro.*
```

```python
out
```

The list is actually slightly special in that it has shortcuts for
joining output lines with spaces or newline characters, via the `.s` and
`.n` attributes:

```python
print(out.s)
```

```python
print(out.n)
```

# In summary

These are just my favorite shortcuts, the ones I find most helpful.
Obviously, there are many more, see `%magic` or `%quickref`. If you
think I've missed a really neat one, let me know!
