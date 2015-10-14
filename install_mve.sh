#!/bin/bash
set -xe

git clone --recursive --depth=1 https://github.com/simonfuhrmann/mve
cd mve
make

# Copy all executables under apps/ to /usr/local/bin
for e in $(find apps/ -executable -type f); do
	cp -rapv ${e} /usr/local/bin
done

cd ..
rm -r mve

