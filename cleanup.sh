#!/usr/bin/env bash

# Remove directories if existed

# TwoCrossCombination
cd TwoCrossCombination
for (( i =0; i<100; i= i+10))
do
    rm $i -rf
done
cd ../
