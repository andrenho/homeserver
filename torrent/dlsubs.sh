#!/bin/sh

echo "### Download subtitles for $1" > /downloads/autorun.log
for f in "$1"/*; do subdl --lang=eng --download=most-downloaded --existing=overwrite "$f"; done >> /downloads/autorun.log 2>&1
for f in "$1"/*; do subdl --lang=pob --download=most-downloaded --existing=overwrite "$f"; done >> /downloads/autorun.log 2>&1
