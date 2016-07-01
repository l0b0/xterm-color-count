XTerm Color Count
=================

Count how many colors your XTerm *actually* supports, since it may be different from what `tput colors` reports.

For example, both gnome-terminal and XTerm support 256 colors, but `tput colors` returns 8.

Usage
-----

    ./xterm-color-count.sh

You might have to wait a few seconds for the result to be returned.

    ./xterm-color-count.sh -v

Print each color number in its own formatting.

Bugs
----

This does not work with the Linux console as it does not support the OSC 4 escape sequence.

Credit
------

L0b0 wrote the code, hackerb9 changed it to a binary search. Gilles did [all the research](http://unix.stackexchange.com/a/23789/3645), and has awesome communication skills and \*nix knowledge. 
