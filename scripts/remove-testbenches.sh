#/usr/bin/env bash

# Removes occurrences of assignment provided testbenches
# from the file supplied as argument to this script

# Use
#	find . -name '*.v' -exec remove-testbenches.sh {} \;
# on the root directory to remove testbenches from every module

perl -i -p0e 's/module testbench.*endmodule//se' $*

for f in $*; do
    echo "  Fixed: $f"
done
