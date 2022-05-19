#!/bin/bash
set -eu

# CANDLE setup
# Run this script to:
# 1) Set up links to the CANDLE data
# 2) Get lighter-weight (CPU&RAM) NT3 settings

if (( ${#} != 1 ))
then
  echo "Provide BENCHMARKS!"
  exit 1
fi
BENCHMARKS=$1
cd $BENCHMARKS || exit 1
if ! [[ -d Pilot1 ]]
then
  echo "Provide BENCHMARKS that is your CANDLE Benchmarks checkout!"
  exit 1
fi

mkdir -pv Data/Pilot1
pushd     Data/Pilot1
if ! [[ -f nt_train2.csv ]]
then
  ln -s ~developer/Public/Data/*.csv .
fi
popd

pushd Pilot1/NT3
cp -v ~developer/Public/Data/nt3_default_model.txt .
popd
