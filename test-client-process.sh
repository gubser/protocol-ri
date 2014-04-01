#!/usr/bin/expect

spawn python3 -m mplane.client

expect "*|mplane| "
puts " "
puts "###############################   Connecting   ########################################"
send -- "connect http://localhost:8888\r"
expect "*|mplane| "
puts " "
puts "##########################   Sending Specification   ##################################"
send -- "when now + 1m / 1s\r"
expect "*|mplane| "
send -- "set destination.ip4 8.8.8.8\r"
expect "*|mplane| "
send -- "runcap 0\r"
expect "*|mplane| "
puts " "
puts "##########################   Waiting for Execution   ##################################"
sleep 70
puts " "
puts "###########################   Asking for Results   ####################################"
send -- "redeem\r"
expect "*|mplane| "
puts " "
puts "#################################   Test OK   #########################################"
