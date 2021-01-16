#!/bin/bash

cd $(dirname $0)
cd ..

rm -rf dev-v2.5-source
rm -rf dev-v2.5-source-alt
rm -rf diff
rm -rf charts

mkdir -p dev-v2.5-source/charts
mkdir -p dev-v2.5-source-alt/charts

git clone --depth 1 --branch dev-v2.5-source https://github.com/rancher/charts 2>/dev/null
pushd charts
make charts
popd
mv charts/charts/* dev-v2.5-source/charts
rm -rf charts

git clone --depth 1 --branch dev-v2.5-source-alt https://github.com/rancher/charts 2>/dev/null
pushd charts
make charts
popd
mv charts/charts/* dev-v2.5-source-alt/charts
rm -rf charts