#!/bin/bash

if [[ ! -f "$1.S" ]]
then
    exit
fi

if [[ ! -d "$1" ]]
then
    mkdir $1
else
    rm ./$1/*
fi

cp $1.S ./$1/.

pushd $1 &> /dev/null

as -g $1.S -o $1.o
EXIT_CODE=$?

if [[ $EXIT_CODE -ne 0 ]]
then
    echo 1>&2 "As Error"
    exit $EXIT_CODE
fi

# ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $1 $1.o -lc
ld -o $1 $1.o
EXIT_CODE=$?

if [[ $EXIT_CODE -ne 0 ]]
then
    echo 1>&2 "Ld Error"
    exit $EXIT_CODE
fi

popd &> /dev/null
