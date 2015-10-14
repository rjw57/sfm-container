#!/bin/bash
set -xe

git clone --recursive --depth=1 https://github.com/openMVG/openMVG
mkdir openMVG_build
cd openMVG_build
cmake -DCMAKE_BUILD_TYPE=Release ../openMVG/src
make
make install
cd ..
rm -r openMVG openMVG_build

