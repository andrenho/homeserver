#!/bin/sh

for f in *;
do
  subdl --lang=eng --download=most-downloaded --existing=overwrite "$f"
done
