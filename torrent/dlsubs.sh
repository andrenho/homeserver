#!/bin/sh

echo >> /downloads/autorun.log
echo "### Download subtitles for $1" >> /downloads/autorun.log
echo >> /downloads/autorun.log
subdl --lang=eng --download=most-downloaded --existing=overwrite "$1" >> /downloads/autorun.log 2>&1
#subdl --lang=pob --download=most-downloaded --existing=overwrite "$1" >> /downloads/autorun.log 2>&1
