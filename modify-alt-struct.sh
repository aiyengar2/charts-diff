#!/bin/bash
set -e

cd $(dirname $0)

for f in dev-v2.5-source-alt/charts/*/*/*; do
    chart_name=$(echo ${f} | cut -d'/' -f4)
    if [[ ${chart_name} == *-crd ]]; then
        chart_name=${chart_name/-crd/\/charts-crd}
    fi
    mkdir -p dev-v2.5-source-alt/charts/${chart_name}
    mv -R ${f}/* dev-v2.5-source-alt/charts/${chart_name}/*
done