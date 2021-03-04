#!/bin/bash
set -e

cd $(dirname $0)
cd ..

for f in migrate-source/charts/*/*/*; do
    chart_name=$(echo ${f} | cut -d'/' -f4)
    if [[ ${chart_name} == *-crd ]] && [[ ${chart_name} != "fleet-crd" ]] && [[ ${chart_name} != "rancher-operator-crd" ]]; then
        chart_name=${chart_name/-crd/\/charts-crd}
    fi
    dest="migrate-source/new-charts/${chart_name}"
    mkdir -p ${dest}
    mv ${f}/* ${dest}
done

rm -rf migrate-source/charts
mv migrate-source/new-charts migrate-source/charts

for f in $(find main-source -type f -name "*.tgz"); do
    tar -xvzf ${f} -C $(dirname ${f})
    rm ${f}
done