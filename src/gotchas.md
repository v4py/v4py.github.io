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

# Python gotchas

You now know enough Python to be dangerous! Unfortunately, that also
means you can occasionally be dangerous to yourself. Python tries hard
to be a consistent language that prevents you from accidentally shooting
yourself in the foot, but there are still many gotchas, as with most
programming languages. Here's a selection of all-time favorites to look
out for as you start building larger and more complicated programs.

# Variable scope

```python
# global scope
a = 2
```

```python
def func():
    print(a)
    # local scope
    b = 3
```

```python
func()
```

```python tags=["raises-exception", "full_width", "output_scroll"]
b
```

```python
def func():
    # local variable shadows global variable
    a = 4
    print(a)
```

```python
func()
```

```python
a
```

Listing global variables:

```python
%who
```

```python
%whos
```

# `return` vs. `print`

```python
def func1():
    return 1
```

```python
def func2():
    print(1)
```

```python
func1()
```

```python
func2()
```

```python
result1 = func1()
```

```python
result1
```

```python
result2 = func2()
```

```python
result2
```

```python
result2 is None
```

Python automatically returns `None` whenever it reaches the end of a
function without encountering a `return` statement, but we can also
`return None` explicitly.

```python
def func2():
    print(1)
    return None
```

```python
func2()
```

```python
res = func2()
```

```python
res is None
```

# Difference between `==` and `is`

```python
list1 = [1, 2]
list2 = [2, 3]
```

```python
list1 == list2
```

```python
list1 is list2
```

```python
list3 = [1, 2]
```

```python
list1 == list3
```

```python
list1 is list3
```

```python
list1
```

```python
list3
```

```python
id(list1)
```

```python
id(list3)
```

```python
list3.append(42)
```

```python
list3
```

```python
list1
```

```python
list1 == list3
```

```python
list3
```

```python
list4 = list3
```

```python
list3 == list4
```

```python
list3 is list4
```

```python
list3.append(5)
```

```python
list3
```

```python
list4
```

```python
def mutating_function(lst):
    lst.append(500)
```

```python
mutating_function(list4)
```

```python
list4
```

# Shallow copies

```python
# either by slicing...
list4[:]
```

```python
list5 = list4[:]
```

```python
list5 == list4
```

```python
list5 is list4
```

```python
# ... or the copy method
list6 = list4.copy()
```

```python
list6 == list4
```

```python
list6 is list4
```

```python
sentences = [
    ["Call", "me", "Ishmael", "."],
    ["I", "am", "tired", "."]
]
```

```python
copy = sentences.copy()
```

```python
sentences == copy
```

```python
sentences is copy
```

```python
copy
```

```python
copy[0][2]
```

```python
copy[0][2] = "David"
```

```python
copy
```

```python
sentences
```

```python
copy is sentences
```

```python
copy[0] is sentences[0]
```

# Deep copies

```python
from copy import deepcopy
```

```python
deep = deepcopy(sentences)
```

```python
deep
```

```python
deep == sentences
```

```python
deep is sentences
```

```python
deep[0] is sentences[0]
```

```python
deep[1] is sentences[1]
```

```python
deep[0][2] = "Ishmael"
```

```python
deep
```

```python
sentences
```

```python
copy
```
