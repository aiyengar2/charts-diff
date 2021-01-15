#!/bin/bash
set -e

cd $(dirname $0)

for f in dev-v2.5-source-alt/charts/*/*/*; do
    chart_name=$(echo ${f} | cut -d'/' -f4)
    if [[ ${chart_name} == *-crd ]] && [[ ${chart_name} != "fleet-crd" ]] && [[ ${chart_name} != "rancher-operator-crd" ]]; then
        chart_name=${chart_name/-crd/\/charts-crd}
    fi
    dest="dev-v2.5-source-alt/new-charts/${chart_name}"
    mkdir -p ${dest}
    mv ${f}/* ${dest}
done

rm -rf dev-v2.5-source-alt/charts
mv dev-v2.5-source-alt/new-charts dev-v2.5-source-alt/charts

for f in $(find dev-v2.5-source -type f -name "*.tgz"); do
    tar -xvzf ${f} -C $(dirname ${f})
    rm ${f}
done