# C in a Nutshell

## Paul Waring

The O'Reilly 'in a Nutshell' series are reference works, describing the details
of a particular topic with examples. As it made clear up front, this is not
a book for those new to C or something which you will read cover to cover,
instead you should view it as a reference to keep beside you when programming.

It's good to see that this book is bang up to date, covering the latest C11
standard. Whilst this hasn't been fully implemented by all compilers -- and
those using embedded platforms may have to wait a long time for full support
-- the book has at least got some future-proofing built in. The authors
have also clearly labelled C11 and C99 features so you can skip over these if
you need to use ANSI C.

It's always difficult to review a reference book as this is something which you
dip into over time, but some of the things I learnt from an initial pass include:

 * How wide and multi-byte characters work in C11, and how to define UTF-8 strings.
 * There is a pre-defined constant called `__func__` which contains the name of
   the current function (useful for printing debug messages).
 * What you can and can't assume about types (e.g. `char` may be `signed` or
   `unsigned` by default).
 * How to use member designators to initialise specific parts of a struct (used
   frequently in the Linux kernel).

Arrays, pointers and dynamic memory management get a chapter each, as befits
their importance and complexity. The standard library is also covered, and the
final part of the book looks at the various components of the C toolchain (the
authors assume GCC is the compiler, but clang supports many of the same command
line options).

Overall, this is a solid reference to C and especially useful if you need to
write code which works on a wide variety of platforms, as the authors spend a
lot of time exploring undefined behaviour. If your job or hobby involves writing
C, this is the book which should be on your desktop (physical or virtual).
