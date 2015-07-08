bashutils
=========

Various bash utilities I use for ubuntu and Mac OSX

template.bash
-------------
Bash 'strict mode' http://redsymbol.net/articles/unofficial-bash-strict-mode/
Script location resolving
This is the template I use when creating bash scripts

install.bash
------------
Creates symlinks for all bash scripts (*.bash) in this directory except for 
template.bash and install.bash to /usr/bin with the .bash extension removed

Exit:
 - 0: success
 - Non-0: failure

bash_template.bash
------------------
Copies template.bash to a new file

Input:
 - Path to a new file that will receive the template

Environment:
 - BASHUTILS_DIR: the location of bashutils, including the template
  - Defaults to the resolved actual location of the script being called

Exit:
 - 0: success
 - Non-0: failure

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

Exit:
 - 0: success
 - Non-0: failure