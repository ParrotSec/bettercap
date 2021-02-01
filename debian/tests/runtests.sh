#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Minimal test: start bettercap and exit

test_start_bettercap() {

    echo "Test start bettercap..."
    cat <<EOF > $AUTOPKGTEST_TMP/bettercap_start
#!/usr/bin/expect
spawn bettercap
expect "type \'help\' for a list of commands"
send "help\n"
expect "active : Show information about active modules."
send "caplets.show\n"
sleep 3
expect "\/usr\/share\/bettercap\/caplets"
sleep 3
send "exit\n"
EOF

    chmod 755 $AUTOPKGTEST_TMP/bettercap_start
    $AUTOPKGTEST_TMP/bettercap_start

}

#### Main ####
for function in "$@"; do
        $function
done

