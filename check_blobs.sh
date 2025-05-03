#!/bin/bash
# Find all blob objects in the repository
git ls-tree -r HEAD | grep blob | while read mode type hash file; do
    if git cat-file -p $hash | grep -q "# contents"; then
        echo "Found in $file (Hash: $hash)"
        git cat-file -p $hash > /tmp/blobfile.txt
        break
    fi
done
