#! /usr/bin/bash

function ggg {
    rg --json \
        --glob=!static \
        --glob=!node_modules \
        --glob=!.git \
        --glob=!*.chunk.js.map \
        --glob=!*.chunk.js \
        --glob=!*.bundle.js \
        --glob=!*.min.js \
        --glob=!*.pack.js \
        --glob=!*jquery*.js \
        --glob=!*.pyc \
        --glob=!*.chunk.css.map \
        --glob=!*.css.map $@ |
        delta --paging never
}
