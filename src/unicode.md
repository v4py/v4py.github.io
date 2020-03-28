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

# Text inside the computer

TODO ... blah blah useful, prevents mistakes... even though as
linguists, we think we know everything about text, this ain't Kansas
anymore as they say, this is Computerland, and the rules for how text
works are strict and sometimes surprising.

This stuff might seem ridiculously low-level to a linguist, but if you
get it wrong, anything that you build on top will crumble like a house
of cards and your linguistic analyses will be likely to yield garbage.
And just to be extra clear, *every single day*, there are professional
programmers who get some of this wrong. When was the last time an e-shop
maltreated the diacritics in your name, for instance?

# Binary and hexadeci-what-now?

Before we get started, humor me as I engage in a short digression on
representing numbers, to make sure we're all on the same page. Why
numbers, I hear you ask, I thought this chapter was supposed to be about
text?  Well because in a computer, it's numbers all the way down, even
text is ultimately represented as numbers. So we need to be relatively
comfortable with the different ways numbers are commonly written down in
the context of computers:

1. as a plain old **decimal** number, using 10 digits 0--9 (e.g. 12)
2. as a **binary** number, using only 2 digits, 0 and 1 (e.g. 1100,
   which equals decimal 12)
3. as a **hexadecimal** number, using 16 digits: 0--9 and a--f (e.g. c,
   which also equals decimal 12)

All of these **numeral systems** can represent any number, the binary
system doesn't stop counting at 1, any more than the decimal system
stops counting at 9 -- beyond these respective points, we just add
another digit and carry on. The only difference is that the fewer
different digits a system uses, the more digits it takes to represent a
number.

<!-- #md tags=["popout"] -->

The **base** of a numeral system corresponds to the number of digits it
uses: 2 for binary, 10 for decimal, 16 for hexadecimal.

<!-- #endmd -->

If you're curious how that works, just take a moment to reflect on what
you do implicitly each time you read a regular decimal number: you
multiply the individual digits with increasing powers of 10, which is
the **base** of the decimal system, starting from the right, and add
this all up:

- e.g. for (regular decimal) 12: $2 \times 10^0 + 1 \times 10^1 = 2
  \times 1 + 1 \times 10 = 12$
- for binary 1100, this goes: $0 \times 2^0 + 0 \times 2^1 + 1 \times
  2^2 + 1 \times 2^3 = 0 + 0 + 4 + 8 = 12$
- and for hexadecimal c: $c \times 16^0 = c \times 1 = 12 \times 1 =
  12$.

<!-- #md tags=["popout"] -->

In theory, nothing prevents us from building decimal computer memory
where each slot distinguishes between ten digits instead of two bits,
and [some early
computers](https://en.wikipedia.org/wiki/Decimal_computer) used that
design. In practice though, it's much harder to make such slots
reliable: distinguishing between ten levels per slot, e.g. based on
differences in voltage, is much more error prone than distinguishing
between just two.

<!-- #endmd -->

Decimal numbers are useful because everybody knows them, which makes
them universally easy to read. Binary numbers are useful because they
closely map to the underlying hardware: **computer memory** consists of
**bits**, tiny slots each of which can hold a 0 or a 1. A group of eight
adjacent bits is called a **byte**.

As a consequence, the need often arises to convert between these
different systems. If you don't want to do so by hand, Python has your
back! The `bin()` function gives you a *string representation* of the
binary form of a number:

```python
bin(65)
```

As you can see, in Python, binary numbers are given a `0b` prefix to
distinguish them from regular (decimal) numbers. The number itself is
what follows after (i.e. 1000001).

Similarly, hexadecimal numbers are given an `0x` prefix:

```python
hex(65)
```

To convert in the opposite direction, i.e. *to* decimal, just evaluate
the binary or hexadecimal representation of a number:

```python
0b1000001
```

```python
0x41
```

Number literals using these different bases are mutually compatible,
e.g. for comparison purposes:

```python
0b1000001 == 0x41 == 65
```

Why are hexadecimals useful? They're primarily a more **convenient,
condensed** way of representing sequences of bits: each hexadecimal
digit can represent 16 different values, and therefore it can stand in
for a sequence of 4 bits, i.e. half a byte ($2^4 = 16$).

```python
0xa == 0b1010
```

```python
0xb == 0b1011
```

```python
# if we paste together hexadecimal a and b, it's the same as pasting
# together binary 1010 and 1011
0xab == 0b10101011
```

In other words, instead of binary 10101011, we can just write
hexadecimal ab and save ourselves some space. Of course, this only works
if shorter binary numbers are **padded to a 4-bit width**:

```python
0x2 == 0b10
```

```python
0x3 == 0b11
```

```python
# if we paste together hexadecimal 2 and 3, we have to paste together
# binary 0010 and 0011...
0x23 == 0b00100011
```

```python
# ... not just 10 and 11
0x23 == 0b1011
```

The padding has no effect on the value, much like decimal 42 and
00000042 are effectively the same numbers.

# Representing text: a DIY approach

With that out of the way, the best way to understand how computers
represent text, and why it works like it does, is to try and come up
with our own system to do that. First of all, we'll need a table of all
the **characters** we want to support, mapping each one of them, you
guessed it, to a unique number, since computers only work with numbers.
For this toy example, let's say four characters are enough:

| number | character |
| ---    | ---       |
| 1      | a         |
| 2      | b         |
| 3      | c         |
| 4      | d         |

Such a table is called a **character set**, and each row is a
**codepoint**, which basically means a number/character pair. Let's
represent our character set as a Python dictionary; since we'll mostly
be concerned with going from characters to numbers, we'll use the
characters as keys.

```python
charset = dict(a=1, b=2, c=3, d=4)
charset
```

Now, we've just established that computers typically know only about two
digits, 0 and 1, but our character set goes up to 4, so we're going to
have to come up with a way to **encode** these numbers into series of
0's and 1's so that we can store them in computer memory. We can think
of an **encoding** as a function which decides how to turn a number into
a sequence of bits. A very simple encoding would be to turn each number
into the corresponding number of 1's and store those in the memory.

<!-- #md tags=["popout"] -->

For these demonstration purposes, we'll be representing computer memory
as strings of 1's and 0's, as it's easier to implement and understand
than if we actually twiddled with individual bits.

<!-- #endmd -->

```python
def encoding1(char):
    num = charset[char]
    return "1" * num
```

Let's see how our new `encoding1` encodes each character in `charset`.

```python
for char in charset.keys():
    print(char, "->", encoding1(char))
```

Looks fine so far, all of the characters map to a different sequence of
bits! Now for something more challenging: let's see how it handles
encoding strings which consist of multiple characters.

```python
[encoding1(char) for char in "ac"]
```

This seems fine as well, except we have to remember that computer memory
is just a long line of contiguous slots, with no boundaries between
them. Even when we conceptually split it into bytes, the byte boundaries
every eight bits are just imagined, it's not like there's some kind of
fence in the memory after every eight slots. So we have to join this
list of strings in order to get a more accurate idea of what our
encoding would actually look like when stored in memory.

```python
"".join(encoding1(char) for char in "ac")
```

Uh-oh. Can you spot the problem? Our encoding works perfectly well one
way, to encode characters into bits, but in the other direction, it
breaks down, because we don't really have a way to reconstruct the
boundaries between individual characters. Imagine you're a program whose
task it is to show characters on screen based on that chunk of memory.
You see those four 1's. What characters should you display? Well, you
could go for `aaaa`. Or for `ac`. Or `d`. Or... You get the gist.

How can we fix this? We'll definitely have to put to use that other
binary digit we have at our disposition, 0, because we just saw our
problem is that `encoding1` yields an undifferentiated, uninterrupted
string of 1's. One way we could do this is by using the 0 as a character
terminator. This `encoding2` is basically the same as `encoding1`, just
with a 0 tacked at the end each time.

```python
def encoding2(char):
    return encoding1(char) + "0"

for char in charset.keys():
    print(char, "->", encoding2(char))

"".join(encoding2(char) for char in "ac")
```

That's better! Now we know that each time we encounter a 0, we've
reached the end of a character, and we can determine which character it
was by counting the number of preceding 1's. So `101110` can only
correspond to `ac`. `encoding2` is the first encoding we've written
worthy of the name because it can go both ways -- at least in theory,
the function we've written obviously works only for encoding; for
**decoding** series of bits into characters, we'd have to write the
inverse function. It's a **variable-width** encoding, because different
characters are encoded using different numbers of bits -- `a` is encoded
as `10` for a width of 2, whereas `c` is 4 bits wide, `1110`.

<!-- #md tags=["popout"] -->

The technical term for this kind of encoding is a [prefix
code](https://en.wikipedia.org/wiki/Prefix_code). The name comes from
the fact that you have to make sure that no character's encoding can be
mistaken for the prefix of another character's (longer) encoding, which
ensures that decoding is possible. By taking into account expected
frequencies of the individual characters, there are ways to
automatically come up with the optimal coding scheme, i.e. that which
yields the shortest encoded messages on average. See [Huffman
coding](https://en.wikipedia.org/wiki/Huffman_coding), but [this blog
post](https://fasterthanli.me/blog/2019/huffman-101/) or [this
video](https://youtu.be/JsTptu56GM8) might be more digestible than the
Wikipedia article.

<!-- #endmd -->

Unfortunately, it's not very good. The number of bits per character
quickly gets out of hand. If we had a character set consisting of all 26
letters of the English alphabet, the last few would take up more than 20
bits per character, and that's just the lowercase letters.

The trouble is that we've tied 1 and 0 down to a single role: 1's
determine the codepoint number, and 0's tell us when to stop adding
those 1's. If we could use both to encode the number, say in its usual
binary form, then we could squeeze a lot more information into the same
space. Something like this:

```python
def encoding3(char):
    num = charset[char]
    binary = bin(num)
    # remove the 0b prefix from the representation
    without_prefix = binary[2:]
    return without_prefix

for char in charset.keys():
    print(char, "->", encoding3(char))

"".join(encoding3(char) for char in "ac")
```

Except `encoding3` has the same drawback as `encoding1`: it's not a
proper encoding, because it doesn't work both ways, the decoding back is
ambiguous. `111` could stand for any of `aaa`, `ac` or `ca`. So how do
we free the hands of the 0 to use its full potential as a digit? Can we
use something else to mark character boundaries? But we've established
there *is* nothing else than 1's and 0's in computer memory!

... unless we use a trick. What if we said that each character always
has to fit into the same number of bits, e.g. 1 byte? Then we could read
memory by chunks of 8 bits and just interpret each chunk as a character.
It would work exactly as if there were actual boundaries delimiting
characters in the memory, spaced evenly 8 bits apart, even though we
know that in actual fact, there are no boundaries between the individual
tiny memory slots. This approach is called a **fixed-width** encoding,
in contrast to the variable-width approach we encountered earlier.

For our toy character set, we don't need 8 bits, 2 are enough to encode
4 different characters, corresponding to the 4 different sequences of
1's and 0's you can create with two available slots: `00`, `01`, `10`
and `11`. Let's what decimal numbers these correspond to -- it's easy,
you can probably do it in your head, but let Python tell us anyway.

```python
0b00, 0b01, 0b10, 0b11
```

Neat, we can easily get those numbers by just shifting the number values
in our character set table by 1 (i.e. subtracting 1). So an `encoding4`
function could look something like this:

```python
def encoding4(char):
    num = charset[char] - 1
    binary = bin(num)
    without_prefix = binary[2:]
    padded = without_prefix.rjust(2, "0")
    return padded
```

The `.rjust()` (and `.ljust()`) methods pad a string to a desired width
with a provided padding character; in our case, we pad to a maximum
width of 2 with 0's, unless the string is already 2 characters wide (or
wider). Perhaps confusingly, `.rjust()` pads on the left and vice versa;
this is because padding on the left *justifies* the text along the
*right* margin (hence `.rjust()`). Let's take this baby out for a spin.

```python
for char in charset.keys():
    print(char, "->", encoding4(char))

"".join(encoding4(char) for char in "ac")
```

Looks alright to me! When decoding, we just chop up the memory into
chunks two bits wide and interpret each as a separate character, so `00`
yields `a` and `10` yields `c`. Piece of cake. This is where we leave
our toy example character set and encodings as they have no more to
teach us, and pick up the thread of the story in the real world.

# Fixed-width encodings: ASCII et al.

Obviously, how many different characters your encoding can handle
depends on how many bits you allow per character:

- with 1 bit you can have $2^1 = 2$ characters (one is mapped to 0, the
  other to 1)
- with 2 bits you can have $2^2 = 2 \times 2 = 4$ characters (mapped to
  00, 01, 10 and 11)
- with 3 bits you can have $2^3 = 2 \times 2 \times 2 = 8$ characters
- etc.

The oldest encoding still in widespread use is called
[`ASCII`](https://en.wikipedia.org/wiki/ASCII), which is a 7-bit
encoding. What's the number of *different* sequences of seven 1's and
0's?

```python
# this is how Python spells 2⁷, i.e. 2*2*2*2*2*2*2
2**7
```

<!-- #md tags=["popout"] -->

"ASCII" stands for "**American** Standard Code for Information
Interchange" -- which explains why there are no accented characters, for
instance.

<!-- #endmd -->

This means `ASCII` can represent [128 different
characters](http://www.ascii-code.com/), which comfortably fits the
basic Latin alphabet (both lowercase and uppercase), Arabic numerals,
punctuation and some "control characters" which were primarily useful on
the old [teletype terminals](https://en.wikipedia.org/wiki/Teleprinter)
for which `ASCII` was designed. For instance, the letter "A" corresponds
to the number 65 (`1000001` in binary, see above).

Nowadays, `ASCII` is represented using 8 bits (= 1 byte), because that's
the unit of computer memory which has become ubiquitous (in terms of
both hardware and software assumptions), but still uses only 7 bits'
worth of information. That extra bit means that there's **room for
another 128 characters in addition to the 128 ASCII ones**, coming up to
a total of 256.

```python
2**(7+1)
```

What happens in the range [128; 256) is not covered by the `ASCII`
standard. In the 1990s, many encodings were standardized which used this
range for their own purposes, usually representing additional accented
characters used in a particular region. E.g. Czech (and Slovak,
Polish...) alphabets can be represented using the ISO `latin-2`
encoding, or Microsoft's `cp-1250`. Encodings which stick to the same
character mappings as `ASCII` in the range [0; 128) **and represent them
physically in the same way (as 1 byte)**, while potentially adding more
character mappings beyond that, are called **`ASCII`-compatible**.

`ASCII` compatibility is a good thing&trade;, because when you start
reading a character stream in a computer, there's **no way to know in
advance what encoding it is in** (unless it's a file you've encoded
yourself and you happen to remember). So in practice, a heuristic has
been established to start reading the stream assuming it's `ASCII` by
default, and switch to a different encoding if evidence becomes
available to the contrary. For instance, HTML files describing web pages
displayed in your browser should all start with something like this:

<!-- #md -->

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  ...
```

<!-- #endmd -->

<!-- #md tags=["popout"] -->

You may be thinking, that `charset` attribute should have more properly
been called `encoding`, and you would be right. As we've seen, a
character set is just a table of characters and numbers. Specifying how
they're represented inside the computer is the encoding's job, which is
what this attribute is supposed to help determine. Which only goes to
show you that this text stuff is hard and even professional programmers
involved in defining standards like HTML sometimes get it wrong.

<!-- #endmd -->

This way, whenever a program wants to read a file like this, it can
start off with `ASCII`, waiting to see if it reaches the `charset` (i.e.
encoding) attribute, and once it does, it can switch from `ASCII` to
that encoding (`UTF-8` here) and restart reading the file, now fairly
sure that it's using the correct encoding. This trick works only if we
can assume that whatever encoding the rest of the file is in, the first
few lines can be considered as `ASCII` for all practical intents and
purposes.

Without the `charset` attribute, the only way to know if the encoding is
right would be for you to look at the rendered text and see if it makes
sense; if it did not, you'd have to resort to trial and error, manually
switching the encodings and looking for the one in which the numbers
behind the characters stop coming out as gibberish and are actually
translated into intelligible text.

Let's take a look at printable characters in the `Latin-2` **character
set**. The character set consists of mappings between positive
**integers** (whole numbers) and characters; each one of these is called
a **codepoint**. The `Latin-2` **encoding** then defines how to encode
each of these integers as a series of bits (1's and 0's) in the
computer's memory.

```python tags=["output_scroll"]
latin2_printable_characters = []
# the Latin-2 character set has 256 codepoints, corresponding to
# integers from 0 to 255
for codepoint in range(256):
    # the Latin-2 encoding is simple: each codepoint is encoded
    # as the byte corresponding to that integer in binary
    byte = bytes([codepoint])
    character = byte.decode(encoding="latin2")
    if character.isprintable():
        latin2_printable_characters.append((codepoint, character))

latin2_printable_characters
```

Using the 8th bit (and thus the codepoint range [128; 256)) solves the
problem of handling languages with character sets different than that of
American English, but introduces a lot of complexity -- whenever you
come across a text file with an unknown encoding, it might be in one of
literally dozens of encodings. Additional drawbacks include:

- how to handle multilingual text with characters from many different
  alphabets, which are not part of the same 8-bit encoding?
- how to handle writing systems which have way more than 256
  "characters", e.g. Chinese, Japanese and Korean (CJK) ideograms?

# Unicode and UTF-8

For these purposes, a standard character set known as
[**Unicode**](https://en.wikipedia.org/wiki/Unicode) was developed which
strives for universal coverage of (ultimately) all characters ever used
in the history of writing, even adding new ones like
[emojis](https://unicode.org/emoji/charts/full-emoji-list.html). Unicode
is much bigger than the character sets we've seen so far -- its most
frequently used subset, the [Basic Multilingual
Plane](https://en.wikipedia.org/wiki/Plane_%28Unicode%29#Basic_Multilingual_Plane),
has $2^16$ codepoints, but overall the number of codepoints is past 1M
and there's room to accommodate many more.

```python
2**16
```

Now, the most straightforward representation for $2^16$ codepoints is
what? Well, it's simply using 16 bits per character, i.e. 2 bytes. That
encoding exists, it's called `UTF-16` ("UTF" stands for "Unicode
Transformation Format"), but consider the drawbacks:

- we've lost `ASCII` compatibility by the simple fact of using 2 bytes
  per character instead of 1 (encoding "a" as `01100001` or
  `00000000|01100001`, with the `|` indicating an imaginary boundary
  between bytes, is not the same thing)
- encoding a string in a language which is mostly written down using
  basic letters of the Latin alphabet now takes up twice as much space
  (which is probably not a good idea, given the general dominance of
  English in electronic communication)

Looks like we'll have to think outside the box. The box in question here
is fixed-width encodings -- all of the real-world encoding schemes we've
encountered so far were fixed-width, meaning that each character was
represented by either 7, 8 or 16 bits. In other words, you could jump
around the string in multiples of 7, 8 or 16 and always land at the
beginning of a character. (Not exactly true for `UTF-16`, because it is
something more than just a "16-bit `ASCII`": it has ways of handling
characters beyond $2^16$ using so-called [surrogate
sequences](https://en.wikipedia.org/wiki/UTF-16#U.2B10000_to_U.2B10FFFF)
-- but you get the gist.)

The smart idea that some bright people have come up with was to use a
variable-width encoding, specifically one that doesn't suck, unlike our
`encoding2`. The most ubiquitous one currently is **`UTF-8`**, which
we've already met in the HTML example above. `UTF-8` *is*
`ASCII`-compatible, i.e. the 1's and 0's used to encode text containing
only `ASCII` characters are the same regardless of whether you use
`ASCII` or `UTF-8`: it's a sequence of 8-bit bytes. But `UTF-8` can also
handle many more additional characters, as defined by the Unicode
standard, by using progressively longer and longer sequences of bits.

```python
def print_utf8_bytes(char):
    """Prints binary representation of character as encoded by UTF-8.

    """
    # encode the string as UTF-8 and iterate over the bytes;
    # iterating over a sequence of bytes yields integers in the
    # range [0; 256); the formatting directive "{:08b}" does two
    # things:
    #   - "b" prints the integer in its binary representation
    #   - "08" left-pads the binary representation with 0's to a total
    #     width of 8, which is the width of a byte
    binary_bytes = [f"{byte:08b}" for byte in char.encode("utf8")]
    print(f"{char!r} encoded in UTF-8 is: {binary_bytes}")

print_utf8_bytes("A")   # the representations...
print_utf8_bytes("č")   # ... keep...
print_utf8_bytes("字")  # ... getting longer.
```

How does that even work? The obvious problem here is that with a
fixed-width encoding, you just chop up the string at regular intervals
(7, 8, 16 bits) and you know that each interval represents one
character. So **how do you know where to chop up a variable
width-encoded string, if each character can take up a different number
of bits?**

Essentially, the trick is to **use some of the bits** in the
representation of a codepoint **to store information** not about which
character it is (whether it's an "A" or a "字"), but **how many bits it
occupies**. This is what we did with our `encoding2`, albeit in a very
primitive way, by simply using 0 as a character delimiter. In other
words, if you want to skip ahead 10 characters in a string encoded with
a variable width-encoding, you can't just skip 10 * 7 or 8 or 16 bits;
you have to read all the intervening characters to figure out how much
space they take up. Take the following example:

```python
for char in "Básník 李白":
    print_utf8_bytes(char)
```

<!-- #md tags=["popout"] -->

If this explanation of how UTF-8 works sounds confusing to you, you can
instead try to watch the [Characters, Symbols and the Unicode
Miracle](https://youtu.be/MijmeoH9LT4) video by the
[Computerphile](https://www.youtube.com/channel/UC9-y-6csu5WGm29I7JiwpnA)
channel on YouTube.

<!-- #endmd -->

Notice the initial bits in each byte of a character follow a pattern
depending on how many bytes in total that character has:

- if it's a 1-byte character, that byte starts with 0
- if it's a 2-byte character, the first byte starts with 11 and the
  following one with 10
- if it's a 3-byte character, the first byte starts with 111 and the
  following ones with 10

This makes it possible to find out which bytes belong to which
characters, and also to spot invalid strings, as the **leading** byte in
a **multi-byte sequence** always "announces" how many **continuation**
bytes (= starting with 10) should follow.

<!-- TODO: discuss why redundancy (i.e. explicitly tagging continuation bytes -->
<!-- with 10) is useful? though UTF-8's pickiness is lightly touched upon below -->

So much for a quick introduction to `UTF-8` (= the encoding), but
there's much more to Unicode (= the character set). While `UTF-8`
defines only how integer numbers corresponding to codepoints are to be
represented as 1's and 0's in a computer's memory, Unicode specifies how
those numbers are to be interpreted as characters, what their properties
and mutual relationships are, what conversions (i.e. mappings between
(sequences of) codepoints) they can undergo, etc.

Consider for instance the various ways diacritics are handled: "č" can
be represented either as a single codepoint ([`LATIN SMALL LETTER C WITH
CARON`](http://www.fileformat.info/info/unicode/char/010D/index.htm) --
all Unicode codepoints have cute names like this) or a sequence of two
codepoints, the character "c" and a combining diacritic mark (`COMBINING
CARON`). You can search for the codepoints corresponding to Unicode
characters e.g.
[here](http://www.fileformat.info/info/unicode/char/search.htm) and play
with them in Python using the `chr(0xXXXX)` built-in function or with
the special string escape sequence `\uXXXX` (where `XXXX` is the
hexadecimal representation of the codepoint) -- both are ways to get the
character corresponding to the given codepoint:

```python
# "č" as LATIN SMALL LETTER C WITH CARON, codepoint 010d
print(chr(0x010d))
print("\u010d")
```

```python
# "č" as a sequence of LATIN SMALL LETTER C, codepoint 0063, and
# COMBINING CARON, codepoint 030c
print(chr(0x0063) + chr(0x030c))
print("\u0063\u030c")
```

```python
# of course, chr() also works with decimal numbers
chr(269)
```

This means you have to be careful when working with languages that use
accents, because **to a computer, the two possible representations are
of course different strings**, even though to you, they're conceptually
the same:

```python
s1 = "\u010d"
s2 = "\u0063\u030c"
# s1 and s2 look the same to the naked eye...
print(s1, s2)
```

```python
# ... but they're not
s1 == s2
```

Watch out, **they even have different lengths**! This might come to bite
you if you're trying to compute the length of a word in letters.

```python
print("s1 is", len(s1), "character(s) long.")
print("s2 is", len(s2), "character(s) long.")
```

For this reason, even though we've been informally calling these Unicode
entities "characters", it is more accurate and less confusing to use the
technical term "codepoints".

Generally, most text out there will use the first, single-codepoint
approach whenever possible, and pre-packaged linguistic corpora will try
to be consistent about this (unless they come from the web, which always
warrants being suspicious and defensive about your material). If you're
worried about inconsistencies in your data, you can perform a
[normalization](https://en.wikipedia.org/wiki/Unicode_equivalence#Normalization):

```python
from unicodedata import normalize

# NFC stands for Normal Form C; this normalization applies a canonical
# decomposition (into a multi-codepoint representation) followed by a
# canonical composition (into a single-codepoint representation)
s1 = normalize("NFC", s1)
s2 = normalize("NFC", s2)

s1 == s2
```

<!-- TODO: explain that to find out graphemes (technically extended grapheme -->
<!-- clusters, which are the closest thing to a layman's notion of -->
<!-- characters), you need the regex package and \X -->

<!-- TODO: move this to the getting your data into python section, along with -->
<!-- the discussion of file IO? -->

Let's wrap things up by saying that Python itself uses Unicode
internally, but the encoding it defaults to when opening an external
file depends on the *locale* of the system (broadly speaking, the set of
region, language and character-encoding related settings of the
operating system). On most modern Linux and macOS systems, this will
probably be a `UTF-8` locale and Python will therefore assume `UTF-8` as
the encoding by default. Unfortunately, Windows is different. To be on
the safe side, whenever opening files in Python, you can specify the
encoding explicitly:

```python .noeval
with open("unicode.ipynb", encoding="utf-8") as file:
    pass
```

In fact, it's **always a good idea to specify the encoding explicitly,
using `UTF-8` as a default** if you don't know, for at least two reasons
-- it makes your code more:

1. **portable** -- it will work the same across different operating
   systems which assume different default encodings;
2. and **resistant to data corruption** -- `UTF-8` is more restrictive
   than fixed-width encodings, in the sense that not all sequences of
   bytes are valid `UTF-8`.

 That second point probably requires elaboration. For instance, if one
 byte starts with 11, then the following one *must* start with 10 (see
 above). If it starts with anything else, it's an error.  By contrast,
 in a fixed-width encoding, *any* sequence of bytes is valid. Decoding
 will always succeed, but if you use the wrong fixed-width encoding, the
 result will be garbage, which you might not notice. Therefore, it makes
 sense to default to `UTF-8`: if it works, then there's a good chance
 that the file actually *was* encoded in `UTF-8` and you've read the
 data in correctly; if it fails, you get an explicit error which prompts
 you to investigate further.

Another good idea, when dealing with Unicode text from an unknown and
unreliable source, is to look at the set of codepoints contained in it
and eliminate or replace those that look suspicious. Here's a function
to help with that:

```python
import unicodedata as ud
from collections import Counter

import pandas as pd

def inspect_codepoints(string):
    """Create a frequency distribution of the codepoints in a string.

    """
    char_frequencies = Counter(string)
    df = pd.DataFrame.from_records(
        (
            freq,
            char,
            f"U+{ord(char):04x}",
            ud.name(char),
            ud.category(char)
        )
        for char, freq in char_frequencies.most_common()
    )
    df.columns = ("freq", "char", "codepoint", "name", "category")
    return df
```

Depending on your font configuration, it may be very hard to spot the
two intruders in the sentence below. The frequency table shows the
string contains regular `LATIN SMALL LETTER T` and `LATIN SMALL LETTER
G`, but also their specialized but visually similar variants
`MATHEMATICAL SANS-SERIF SMALL T` and `LATIN SMALL LETTER SCRIPT G`. You
might want to replace such codepoints before doing further text
processing...

```python
inspect_codepoints("Intruders here, good 𝗍hinɡ I checked.")
```

... because of course, for a computer, the word "thing" written with two
different variants of "g" is really just two different words, which is
probably not what you want:

```python
"thing" == "thinɡ"
```

So to sum up:

- Unicode strives to be a universal character set. It contains *a lot*
  of characters, many very similar-looking yet different. Appearances
  can be deceptive, when in doubt, examine which codepoints you're
  actually dealing with and/or normalize.
- Unicode can be encoded using different encodings. Some are fixed-width
  (`UTF-32`, which we haven't mentioned yet), some are almost
  fixed-width (`UTF-16`), some are variable-width (`UTF-8`).
- `UTF-8` has many desirable properties, so you should always use it
  when saving plain text files, and always assume it as a first try when
  opening files in an unknown encoding.
- Internally, Python uses a custom representation of Unicode, which is
  neither of the encodings we already mentioned.
- The following functionality is useful for inspecting Unicode data in
  Python: the `ord()` and `chr()` built-in functions, the `unicodedata`
  standard library module, and the `regex` external package, which like
  the standard library `re` module implements regular expression support
  from Python, but unlike the latter, it provides much more extensive
  Unicode support.
