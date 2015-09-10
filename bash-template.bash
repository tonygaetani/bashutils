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
	echo "usage:" >&2
	echo "BASHUTILS_DIR=/path/to/bashutils bash-template file ..." >&2
	exit 100
fi

# make sure parent folder exists, if any
if [[ "${1}" = */* ]]; then
	stat $(dirname "${1}")
fi

if [[ -z "${BASHUTILS_DIR-}" ]]; then
	BASHUTILS_DIR="${DIR}"
fi

cat "${BASHUTILS_DIR}/template.bash" > "${1}"
chmod +x "${1}"
