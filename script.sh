#! /usr/bin/env bash

arr_size=(8 16 32)

for arg in $@
do
    for key in ${!arr_size[@]}
    do
       python3 $arg.py ${arr_size[$key]} >> $arg.out
    done
done


