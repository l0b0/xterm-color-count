XTerm Color Count
=================

Count how many colors your XTerm *actually* supports, since it may be different from what `tput colors` reports.

For example, both gnome-terminal and XTerm support 256 colors, but `tput colors` returns 8.

Usage
-----

    ./xterm-color-count.sh

You might have to wait a few seconds for the result to be returned.

    ./xterm-color-count.sh -v

Print each color number and show what it looks like.

    ./xterm-color-count.sh [number]

Show all the colors, like -v, but use a given number instead of the count.

Bugs
----

* This does not work with the Linux console as it does not support the OSC 4 escape sequence. Instead the script falls back to `tput colors` which uses the terminfo file.

Discussion
----------
* It is a mystery why the default terminfo for XTerm and gnome-terminal lie about how many colors they have. You can "fix" it so `tput colors` returns the proper result by using `export TERM=xterm-256color`. Some applications (such as emacs in a terminal window) will use the extra colors. For example, try,
```
    TERM=xterm-256color  emacs -nw -f list-colors-display -f delete-window
```
* A 256 color XTerm has this color mapping
  * System colors: 0 to 15
  * Grayscale: 232 to 255 _(note, black and white intentionally omitted)_
  * 6x6x6 color cube: 16-231
    _(For R,G,B between 0 and 5, `color-index = 16 + R×6×6 + G×6 + B`)_

Credit
------

L0b0 wrote the code, hackerb9 changed it to a binary search. Gilles did [all the research](http://unix.stackexchange.com/a/23789/3645), and has awesome communication skills and \*nix knowledge.
