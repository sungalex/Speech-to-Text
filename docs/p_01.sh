#!/bin/bash

for file in `ls ./wav/*.wav`
do
    src=$file
    dest=${file//wav/flac}
    echo "$src $dest"
    cp "$src" "$dest"
done

ls -al ./flac
