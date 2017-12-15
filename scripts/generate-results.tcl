#!/usr/bin/tclsh
source sha-256.tcl
set testMsg "This is a test message, a long test message"
puts "Multiblock message: $testMsg"
puts "[sha256 $testMsg]\n"
