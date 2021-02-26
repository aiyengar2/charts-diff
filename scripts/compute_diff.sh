#!/bin/bash

cd $(dirname $0)
cd ..

rm -rf diff
mkdir -p diff

for f in main-source/charts/*; do
    diff -x '*.tgz' -x '*.lock' -uNr ${f} ${f/main-source/migrate-source} > diff/$(basename -- ${f}).diff
done