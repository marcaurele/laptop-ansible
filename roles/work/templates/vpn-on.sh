#!/usr/bin/expect -f

spawn nmcli connection up {{ company }} --ask;
expect "Username";
send "{{ username }}\r";
expect -re "Password" {;
send -- [exec pass {{ company }}/jumpcloud | head -1];
send ",";
send -- [exec pass otp {{ company }}/jumpcloud]\r; };
interact;
puts "\nDone\n";
exit;