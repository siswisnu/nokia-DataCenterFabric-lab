
#!/bin/bash

clab destroy -t 3tierSmall.yaml
rm -Rrf .yaml.*
rm *.tmpl*

echo "create dummpy lincenses"
mkdir license
touch license/lic-srl.txt
touch license/lic-sros.txt 

mkdir startup-config

docker pull ghcr.io/asadarafat/topoviewer:latest
docker image prune -f

wget --no-cache https://raw.githubusercontent.com/asadarafat/topoViewer/master/rawTopoFile/clab-topo-export-template-example/clab-topo-new-version-cytoscape.tmpl
wget --no-cache https://raw.githubusercontent.com/asadarafat/nokia-DataCenterFabric-lab/main/3tierSmall.yaml


clab deploy -t 3tierSmall.yaml --export-template clab-topo-new-version-cytoscape.tmpl