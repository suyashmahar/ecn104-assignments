#/usr/bin/env bash

# Changes line ending of all the verilog files in the directory
# path passed to script to UNIX style

find $* -name '*.v' -exec dos2unix {} \;
