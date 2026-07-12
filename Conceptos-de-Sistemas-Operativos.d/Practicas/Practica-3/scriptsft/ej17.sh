#!/bin/bash
#
ls | cut -d. -f1 | tr 'a-zA-Z' 'A-Za-z' | tr -d 'aA' 
