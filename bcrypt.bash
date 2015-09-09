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

if [[ -z "${PASSWORD-}" ]]; then
    echo "PASSWORD required in environment" >&2
    exit 100
fi

node << NODE_BCRYPT
var fs = require('fs');
var bcrypt = require('bcrypt');
bcrypt.genSalt(10, function(err, salt) {
    bcrypt.hash("${PASSWORD}", salt, function(err, hash) {
        fs.writeSync(1, hash);
        fs.writeSync(1, '\n');
        fs.fsyncSync(1);
    });
});
NODE_BCRYPT
