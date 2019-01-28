#!/usr/bin/env bash

for X in demo-jobs-reactor-app pipelines-manager jobs-manager jobs-indexer jobs-agave-proxy
do
    mkdir -p docs/$X
    cp -f $X/README.rst docs/$X/
done
