#!/bin/bash
set -xe

_work_dir=$(pwd)
git clone --recursive --depth=1 https://github.com/cdcseacave/openMVS
svn checkout svn://svn.code.sf.net/p/vcg/code/trunk/vcglib vcglib

# There are some disgusting hacks required to get OpenMVS to build. I'm sorry
# :(.
if [ -f openmvs-hacks.patch ]; then
	echo "Applying hacks..."
	pushd openMVS
	patch -p1 < ${_patch_dir}/openmvs-hacks.patch
	popd
	rm openmvs-hacks.patch
fi

mkdir /opt/openMVS
cd /opt/openMVS
cmake -DCMAKE_BUILD_TYPE=Release -DVCG_DIR=${_work_dir}/vcglib ${_work_dir}/openMVS
make
rm -r ${_work_dir}/openMVS ${_work_dir}/vcglib


