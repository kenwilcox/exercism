#!/usr/bin/env bash

upper='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
lower='abcdefghijklmnopqrstuvwxyz'
echo "$1" | tr 'a-zA-Z' "${lower:$2}${lower:0:$2}${upper:$2}${upper:0:$2}"
