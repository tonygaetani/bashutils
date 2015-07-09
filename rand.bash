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
	MAX_VAL=100
else
	MAX_VAL=$1
fi

re='^[0-9]+$'
if ! [[ $MAX_VAL =~ $re ]] ; then
	exit 100
fi

echo $(( ( RANDOM % $MAX_VAL )  + 1 ))