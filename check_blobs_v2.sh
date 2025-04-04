#!/bin/bash
# Find all blob objects in the repository
# Any repository
git ls-tree -r HEAD | grep blob | while read mode type hash file; do
    echo "=== File: $file (Hash: $hash) ==="
    git cat-file -p $hash | head -n 10
    echo ""
done
