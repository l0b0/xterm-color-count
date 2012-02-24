XTerm Color Count
=================

Count how many colors your XTerm *actually* supports, since it may be different from what `tput colors` reports.

For example, on my desktop (Ubuntu 11.10 with XTerm(271)) `tput colors` returns 8 while XTerm actually supports 256 colors.

Usage
-----

    ./xterm-color-count.sh

You might have to wait a few seconds for the result to be returned.

    ./xterm-color-count.sh -v

Print each color number in its own formatting.

Credit
------

Gilles did [all the research](http://unix.stackexchange.com/a/23789/3645), and has awesome communication skills and \*nix knowledge.
