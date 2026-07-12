#!/bin/bash
echo $(ls -l | grep "^-" | awk '{print $9}' | cut -d '.' -f1 | tr 'a-zA-Z' 'A-Za-z' | tr -d 'aA')
