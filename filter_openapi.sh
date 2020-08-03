#!/bin/bash

jq \
"delpaths([ \
    (.paths | keys | .[] | select(test(\"relationships\")) | [\"paths\",.]) \
]) | \
delpaths([ \
    (.paths | to_entries | .[] | select(.value == {}) | [\"paths\", .key]) \
])"  \
$1
