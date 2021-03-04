#!/bin/bash

cd $(dirname $0)
cd ..

rm -rf main-source
rm -rf migrate-source
rm -rf diff
rm -rf rke2-charts

mkdir -p main-source/charts
mkdir -p migrate-source/charts

git clone --depth 1 --branch main-source https://github.com/rancher/rke2-charts 2>/dev/null
pushd rke2-charts
make charts
popd
mv rke2-charts/charts/* main-source/charts
rm -rf rke2-charts

git clone --depth 1 --branch migrate-source https://github.com/aiyengar2/rke2-charts 2>/dev/null
pushd rke2-charts
make charts
popd
mv rke2-charts/charts/* migrate-source/charts
rm -rf rke2-charts