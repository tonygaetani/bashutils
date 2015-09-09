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

if [[ -z "${1-}" ]]; then
    echo "usage: alarm <seconds>" >&2
    exit 100
fi

# simple integer check
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
    exit 101
fi

ALARM_FILE=/usr/local/share/alarms/current.mp3

# make sure 'current' alarm exists
if ! [[ -f "${ALARM_FILE}" ]]; then
    exit 102
fi

# make sure SoX is installed to play a sound
if [[ -z $(which play) ]]; then
    echo "please install SoX (brew install sox)" >&2
    exit 103    
fi

# no more output...
exec > /dev/null 2>&1

sleep $1
play "${ALARM_FILE}"

