#!/bin/bash
set -xe

git clone --recursive --depth=1 https://ceres-solver.googlesource.com/ceres-solver
mkdir ceres-solver_build
cd ceres-solver_build
cmake ../ceres-solver
make
make install
cd ..
rm -r ceres-solver ceres-solver_build

