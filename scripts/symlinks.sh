#!/usr/bin/env sh

set -e
for size in 16x10 16x9 4x3
do 
    echo $size
    rm -rf */backgrounds/cybint-$size
    for image in */backgrounds/*/*-$size.*
    do 
        symlinks_dir="$(dirname "$image")/../cybint-$size/"
        mkdir -p $symlinks_dir/
        ln -rsfv "$image" "${symlinks_dir}$(basename "$image" | sed 's/-[[:digit:]]\+x[[:digit:]]\+//')"
    done
done
