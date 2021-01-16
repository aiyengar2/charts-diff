#!/bin/bash

cd $(dirname $0)
cd ..

rm -rf diff
mkdir -p diff

for f in dev-v2.5-source/charts/*; do
    diff -x '*.tgz' -x '*.lock' -uNr ${f} ${f/dev-v2.5-source/dev-v2.5-source-alt} > diff/$(basename -- ${f}).diff
done