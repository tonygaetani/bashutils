bashutils
=========

Various bash utilities I use for ubuntu and Mac OSX

template.bash
-------------
Bash 'strict mode' http://redsymbol.net/articles/unofficial-bash-strict-mode/
Script location resolving
This is the template I use when creating bash scripts
The script that is output is marked as executable by everyone

install.bash
------------
Creates symlinks for all bash scripts (*.bash) in this directory except for 
template.bash and install.bash to /usr/local/bin with the .bash extension removed

 usage: ./install.bash [help]

Environment:
 - DEBUG: set to preserve stdout/err
 - DESTINATION: path to install symlink (/usr/local/bin)
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
 - 101: file already exists

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

brew-install.bash
------------------
Carefully and interactively installs homebrew (http://brew.sh)

Exit:
 - 0: success

alarm.bash
----------
Plays an mp3 file /usr/local/share/alarms/current.mp3 after n seconds.
The user is expected to keyboard interrupt to cancel the alarm.

Requirements:
 SoX, or an alternative program named 'play' that accepts an mp3 file as a parameter and plays it.
 ```brew install sox```

Parameters:
 1: minimum guaranteed number of seconds to wait

Exit:
 - Non-0: failure
 - 100+: known failure
 - 100: missing parameter
 - 101: parameter invalid (must be integer)
 - 102: current alarm file missing

git-switch-user.bash
--------------------
runs git config --global user.name and user.email

Environment:
NAME - required
EMAIL - required

Exit:
 - 0: success
 - Non-0: failure

nproc.bash
-----------
reports the number of processors to stdout (according to sysctl)

Exit:
 - 0: success
 - Non-0: failure

bcrypt.bash
-----------
creates a bcrypt hash intended to be used as a password
uses python bcrypt module
uses python getpass module

password on tty at runtime

TODO:
accept password as stdin

salt rounds should be configurable

accept password in environment and stdin

Environment:
PREFIX - the bcrypt prefix to use (default 2a)

Exit:
 - 0: success
 - Non-0: failure
