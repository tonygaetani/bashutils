bashutils
=========

Various bash utilities I use for ubuntu and Mac OSX

template.bash
-------------
Bash 'strict mode' http://redsymbol.net/articles/unofficial-bash-strict-mode/
Script location resolving
This is the template I use when creating bash scripts

split_string.bash
-----------------
Splits a string on to separate lines. Useful for creating arrays in bash.

Input:
 - If an argument is given, it is read
 - If no argument is given, stdin is read

Output:
 - The input is broken up by lines and SPLIT_CHAR (see environment section) 
 and printed to stdout

Environment:
 - SPLIT_CHAR: the IFS used while reading input
  - Defaults to ', '
  - Can be overridden in environment
