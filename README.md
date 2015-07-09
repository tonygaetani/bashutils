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
template.bash and install.bash to /usr/local/bin with the .bash extension removed

Exit:
 - 0: success
 - non-0: failure

bash-template.bash
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
 - 100+: known failure
 - 100: missing parameter

split-string.bash
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

rand.bash
------------------
Generates a random number from 1-100

Input:
 - 1st argument: max value (100 is used by default)

Output:
 - A pseudo-random number using bash's RANDOM

Exit:
 - 0: success
 - Non-0: failure
 - 100+: known failure
 - 100: max value is not a number

isodate.bash
------------------
Generates an ISO 8601 timestamp

Output:
 - an ISO 8601 timestamp

Exit:
 - 0: success
 - Non-0: failure
