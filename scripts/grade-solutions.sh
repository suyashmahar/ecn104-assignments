#!/usr/bin/env bash

# Scripts takes directory path as input where it expects to 
# find solution for a student along with all the testbenches

# The user must manually place testbenches in the directory
# before executing this script. Use this script in combination
# with find and/or for loop to iterate over all student's
# solution

# (c) 2019 Suyash Mahar <suyash12mahar@outlook.com>

# All the testbenches are defined here

shopt -s extglob # Enable extended globs
set -o pipefail  # Enable pipefail

TESTBENCHES=(testbench_1_1.v  testbench_1_2_1.v  testbench_1_2_2.v  testbench_1_3.v  testbench_1_4.v)
args=$* # Arguments passed to this script

# Check for number of arguments
if [[ "$args" == "" ]]; then
    echo "  ERROR: This scripts expects a single argument. Check source code for help. Exiting..."
    exit 1
fi

# Check for iverilog and vvp
command -v iverilog >/dev/null 2>&1 || { echo "  ERROR: iverilog not found, please install it using your package manager"; exit 1; }
echo "  INFO: Found iverilog"
command -v vvp >/dev/null 2>&1 || { echo "  ERROR: vvp not found, please install it using your package manager"; exit 1; }
echo "  INFO: Found vvp"

result=""
for testbench in ${TESTBENCHES[*]}; do

    # Compile one of the testbench and pass all other modules
    modules=($(ls -d !(testbench*|*.vvp)))

    echo "  Executing: iverilog -otest.vvp $testbench ${modules[*]}"
    iverilog -otest.vvp $testbench ${modules[*]} 2>&1 | sed -e 's/^/  iverilog: /' \
        || { echo "  ERROR: Compilation for $testbench failed, exiting..."; exit 1; }

    echo "  Executing: vvp test.vvp"
    out=$(vvp test.vvp | grep -o 'passed')

#    if [ $? -ne  0 ]; then
#        echo "  ERROR: Evaluation of $testbench failed, exiting..." 
#        exit 1
#    fi

    if [[ "$out" == "passed" ]]; then
        result=$result,0
    else
        result=$result,.
    fi

    rm test.vvp

    echo "  INFO: Done with $testbench."
done

echo "${TESTBENCHES[*]}"
echo "$result"

