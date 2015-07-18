#!/usr/bin/env bash
set -euo pipefail

IFS=
# http://stackoverflow.com/a/246128/6554
SOURCE="${BASH_SOURCE[0]}"
# resolve $SOURCE until the file is no longer a symlink
while [ -h "$SOURCE" ]; do 
	DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
	SOURCE="$(readlink "$SOURCE")"
	# if $SOURCE was a relative symlink, we need to resolve it relative to the
	# path where the symlink file was located
	[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

IFS=$'\n\t'

if [[ "${1-}" == "help" ]]; then
    echo 'brew-install'
    echo '  usage: brew-install'
    echo ''
    exit 0
fi

echo 'warning!'
echo 'you are about to pipe some random code directly into ruby'
echo 'do you want to at least look at it first? [Y/n]'
read INPUT

if [[ -z "${INPUT}" || ! "${INPUT}" =~ [N/n] ]]; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | less || true
fi

echo 'are you sure you want to pipe this stuff into ruby? [y/N]'
read INPUT

if [[ ! "${INPUT}" =~ [Y/y] ]]; then
    echo "thats probably safer, anyway"
    exit 0
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

