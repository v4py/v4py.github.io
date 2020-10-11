---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.12
    jupytext_version: 1.6.0
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# Python gotchas

## With great power comes great responsibility

You now know enough Python to be dangerous! Unfortunately, that also
means you can occasionally be dangerous to yourself. Python tries hard
to be a consistent language that prevents you from accidentally shooting
yourself in the foot, but there are still many gotchas, as with most
programming languages. Here's a selection of all-time favorites to look
out for as you start building larger and more complicated programs.

## Variable scope

```{code-cell} ipython3
# global scope
a = 2
```

```{code-cell} ipython3
def func():
    print(a)
    # local scope
    b = 3
```

```{code-cell} ipython3
func()
```

```{code-cell} ipython3
:tags: [raises-exception, full-width, output_scroll]

b
```

```{code-cell} ipython3
def func():
    # local variable shadows global variable
    a = 4
    print(a)
```

```{code-cell} ipython3
func()
```

```{code-cell} ipython3
a
```

Listing global variables:

```{code-cell} ipython3
%who
```

```{code-cell} ipython3
%whos
```

## `return` vs. `print`

```{code-cell} ipython3
def func1():
    return 1
```

```{code-cell} ipython3
def func2():
    print(1)
```

```{code-cell} ipython3
func1()
```

```{code-cell} ipython3
func2()
```

```{code-cell} ipython3
result1 = func1()
```

```{code-cell} ipython3
result1
```

```{code-cell} ipython3
result2 = func2()
```

```{code-cell} ipython3
result2
```

```{code-cell} ipython3
result2 is None
```

Python automatically returns `None` whenever it reaches the end of a
function without encountering a `return` statement, but we can also
`return None` explicitly.

```{code-cell} ipython3
def func2():
    print(1)
    return None
```

```{code-cell} ipython3
func2()
```

```{code-cell} ipython3
res = func2()
```

```{code-cell} ipython3
res is None
```

## Difference between `==` and `is`

```{code-cell} ipython3
list1 = [1, 2]
list2 = [2, 3]
```

```{code-cell} ipython3
list1 == list2
```

```{code-cell} ipython3
list1 is list2
```

```{code-cell} ipython3
list3 = [1, 2]
```

```{code-cell} ipython3
list1 == list3
```

```{code-cell} ipython3
list1 is list3
```

```{code-cell} ipython3
list1
```

```{code-cell} ipython3
list3
```

```{code-cell} ipython3
id(list1)
```

```{code-cell} ipython3
id(list3)
```

```{code-cell} ipython3
list3.append(42)
```

```{code-cell} ipython3
list3
```

```{code-cell} ipython3
list1
```

```{code-cell} ipython3
list1 == list3
```

```{code-cell} ipython3
list3
```

```{code-cell} ipython3
list4 = list3
```

```{code-cell} ipython3
list3 == list4
```

```{code-cell} ipython3
list3 is list4
```

```{code-cell} ipython3
list3.append(5)
```

```{code-cell} ipython3
list3
```

```{code-cell} ipython3
list4
```

```{code-cell} ipython3
def mutating_function(lst):
    lst.append(500)
```

```{code-cell} ipython3
mutating_function(list4)
```

```{code-cell} ipython3
list4
```

## Shallow copies

```{code-cell} ipython3
# either by slicing...
list4[:]
```

```{code-cell} ipython3
list5 = list4[:]
```

```{code-cell} ipython3
list5 == list4
```

```{code-cell} ipython3
list5 is list4
```

```{code-cell} ipython3
# ... or the copy method
list6 = list4.copy()
```

```{code-cell} ipython3
list6 == list4
```

```{code-cell} ipython3
list6 is list4
```

```{code-cell} ipython3
sentences = [
    ["Call", "me", "Ishmael", "."],
    ["I", "am", "tired", "."]
]
```

```{code-cell} ipython3
copy = sentences.copy()
```

```{code-cell} ipython3
sentences == copy
```

```{code-cell} ipython3
sentences is copy
```

```{code-cell} ipython3
copy
```

```{code-cell} ipython3
copy[0][2]
```

```{code-cell} ipython3
copy[0][2] = "David"
```

```{code-cell} ipython3
copy
```

```{code-cell} ipython3
sentences
```

```{code-cell} ipython3
copy is sentences
```

```{code-cell} ipython3
copy[0] is sentences[0]
```

## Deep copies

```{code-cell} ipython3
from copy import deepcopy
```

```{code-cell} ipython3
deep = deepcopy(sentences)
```

```{code-cell} ipython3
deep
```

```{code-cell} ipython3
deep == sentences
```

```{code-cell} ipython3
deep is sentences
```

```{code-cell} ipython3
deep[0] is sentences[0]
```

```{code-cell} ipython3
deep[1] is sentences[1]
```

```{code-cell} ipython3
deep[0][2] = "Ishmael"
```

```{code-cell} ipython3
deep
```

```{code-cell} ipython3
sentences
```

```{code-cell} ipython3
copy
```

## Unlike the postman, imports only ever run once

```{code-cell} ipython3
%%writefile my_module.py
def add_ten(num):
    return num + 1
```

```{code-cell} ipython3
import my_module

my_module.add_ten(3)
```

Now you realize you made a mistake and fix it.

```{code-cell} ipython3
%%writefile my_module.py
def add_ten(num):
    return num + 10
```

```{code-cell} ipython3
import my_module

my_module.add_ten(3)
```

Still wrong, modules are only loaded once (explain why).

In JupyterLab (IPython), there's a workaround. Unfortunately, it won't
work on previously imported modules, so we need to create a new one.

```{code-cell} ipython3
# cleanup
%rm my_module.py

%load_ext autoreload
%autoreload 1
```

```{code-cell} ipython3
%%writefile another_module.py
def add_ten(num):
    # d'oh, again!
    return num + 1
```

```{code-cell} ipython3
# notice %aimport instead of regular import
%aimport another_module

another_module.add_ten(3)
```

```{code-cell} ipython3
%%writefile another_module.py
def add_ten(num):
    return num + 10
```

```{code-cell} ipython3
another_module.add_ten(3)
```

Check out the various usage options by invoking `?%autoreload`. But
careful, such module reloading is not in general guaranteed to work,
Python just really doesn't like it. If you run into weird behavior doing
this, the safe bet is to just restart your Python session (what
JupyterLab calls the **kernel**).

```{code-cell} ipython3
# cleanup
%rm another_module.py
```

<!-- vim: set spell spelllang=en: -->
