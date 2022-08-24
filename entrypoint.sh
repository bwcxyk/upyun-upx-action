#!/bin/sh -l

#set -e at the top of your script will make the script exit with an error whenever an error occurs (and is not explicitly handled)
set -eu

upx login $1 $2 $3

upx sync $4 $5 --delete

upx logout

echo 'Deploy Success'
exit 0