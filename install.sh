#!/usr/bin/bash

for f in `ls dotfiles`; do
    dst=$HOME/.$f
    if [ -e $dst ]; then
        if [ -h $dst ]; then
            unlink $dst
        else
            mv -vv $dst $dst.bak.`date +%s`
        fi
    fi
    ln -s `realpath dotfiles/$f` $dst
done
