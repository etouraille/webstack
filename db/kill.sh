#!/bin/bash
mysql -uroot -pb1otope -e "select concat('KILL ',id,';') from information_schema.processlist where Command =    'Sleep' AND user = 'root' into outfile '/tmp/sleep_processes.txt'"
mysql -uroot -pb1otope -e "source /tmp/sleep_processes.txt;"
rm -rf /tmp/sleep_processes.txt