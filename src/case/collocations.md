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

# Collocations

## Determining collocation strength

Collocation strength between two words, *x* and *y*, can be quantified
in various ways using so-called **association measures**. One which
gives fairly useful and intuitive results is the **Dice score**:

$\Huge{Dice = \frac{f(xy)}{\frac{f(x) + f(y)}{2}} = \frac{2 f(xy)}{f(x) + f(y)}}$
