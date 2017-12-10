#!/usr/bin/tclsh

set ano 1; # Set this for assignment number
set tqno 10; # Set total number of questions

puts "Starting design evaluation for Assignment $ano"

# Loop over questions and check them
for {set qno 1} {$qno < $tqno} {incr qno} {
    puts "Checking solution for problem ${ano}.${qno}"
    close_sim
    set_property top testbench_${ano}_${qno} [get_filesets sim_1]
    launch_simulation   
}

puts "Script completed"

