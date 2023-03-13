#! /bin/bash

# Original https://github.com/scheib/chromium-latest-linux/blob/4f4e9b85ea02a109e071452de936389cc2fd7376/update.sh
# With modifications

set -e

cd $(dirname $0)

LASTCHANGE_URL="https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_ARM_Cross-Compile%2FLAST_CHANGE?alt=media"

REVISION=$(curl -s -S $LASTCHANGE_URL)

echo "latest revision is $REVISION"

if [ -d $REVISION ] ; then
  echo "already have latest version"
  exit
fi

ZIP_URL="https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_ARM_Cross-Compile%2F$REVISION%2Fchrome-linux.zip?alt=media"

ZIP_FILE="${REVISION}-chrome-linux.zip"

echo "fetching $ZIP_URL"

rm -rf $REVISION
curl -# $ZIP_URL > $ZIP_FILE
echo "unzipping.."
rm -rf /latest
unzip -d /latest $ZIP_FILE
