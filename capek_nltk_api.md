# What we're *not* going to do right now: the NLTK corpus API

[Chapter 2](https://www.nltk.org/book/ch02.html), [Chapter 3](https://www.nltk.org/book/ch03.html)

```python
%ll /home/lukes/edu/python/capek/
```

```python
%cat /home/lukes/edu/python/capek/CATEGORIES
```

```python
from nltk.corpus import CategorizedPlaintextCorpusReader
```

```python
capek = CategorizedPlaintextCorpusReader(
    "/home/lukes/edu/python/capek",
    r".*\.txt",
    encoding="cp1250",
    cat_file="CATEGORIES"
)
```

```python
capek
```

```python
capek.fileids()
```

```python
capek.categories()
```

```python
capek.raw()[:100]
```

```python
capek.sents()
```

```python
capek.paras()
```

```python
capek.words()
```

```python
capek.words(fileids='utopie:krakatit.txt')
```

```python
capek.words(fileids=['drama:rur.txt', 'utopie:krakatit.txt'])
```

```python
capek.words(categories="drama")
```

```python
from nltk.corpus import PlaintextCorpusReader
```

