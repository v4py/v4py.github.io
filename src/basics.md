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

(TODO: if more extensive comments → dedicated Markdown cells, use menu
above to switch Cell from Code)

The `*` operator is used for multiplication, `/` for division, `//` for
truncating division and `**` for exponentiation.

```python
2 * 3
```

```python
4 / 3
```

```python
4 // 3
```

```python
2**3
```

A decimal point, `.`, is used to separate the whole number part from the
fractional part of a number.

```python
0.1 + 0.1
```

But enough about numbers! ... strings


At this point, probably sick and tired of reaching for your mouse to
press ▶ all the time. Keyboard shortcuts:

- `Alt+Enter`: evaluate, insert new cell and switch to it
- `Shift+Enter`: evaluate and switch to next (existing) cell
- `Ctrl+Enter`: evaluate and stay at current cell
