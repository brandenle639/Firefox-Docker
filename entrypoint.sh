#!/bin/bash
if [[ $# -lt 1 ]]; then
    firefox
else
    $@
fi
