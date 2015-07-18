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
    echo 'install bashutils'
    echo ' usage: ./install.bash'
    echo 'environment'
    echo ' DEBUG - set to preserve stdout/err'
    echo ' DESTINATION - default is /usr/local/bin'
    exit 0 
fi

if [[ -z "${DEBUG-}" ]]; then
    exec > /dev/null 2>&1
fi

if [[ -z "${DESTINATION-}" ]]; then
    DESTINATION='/usr/local/bin'
fi

FILES=($(
	find "${DIR}" -type f -maxdepth 1 -name '*.bash' | \
	grep --invert-match --line-regexp "${DIR}/install.bash" | \
	grep --invert-match --line-regexp "${DIR}/template.bash"
))

for file in "${FILES[@]}"
do
	FILE_NO_EXT=$(basename "${file}")
	FILE_NO_EXT="${FILE_NO_EXT%.*}"
	ln -sf "$(pwd)/$(basename ${file})" "${DESTINATION}/${FILE_NO_EXT}"
done
