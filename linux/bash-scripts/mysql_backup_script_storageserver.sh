#!/bin/bash
#
echo "==========================="
echo "=== MySQL Backup Script ==="
echo "==========================="

mysql_user=$1
mysql_password=$2
mysql_db=$3
storage_server_ip=$4

Database_backup_file=$mysql_db-$(date +'%d%m%Y'-'%H%M%S').sql

echo "First Time backup file name is $Database_backup_file"

mysqldump -u $mysql_user $mysql_db -p$mysql_password > $Database_backup_file
echo "Successully Backup Has been Generated"

#scp -i <key_name> source_file_name destination_server_ip:destination_dir _name

scp -i /home/ubuntu/.ssh/id_ed25519 $Database_backup_file ubuntu@$storage_server_ip:/home/ubuntu/mysql_01_backup/$Database_backup_file

echo "--- Deleting backup from local server ---"
rm -f /home/ubuntu/$Database_backup_file
echo "The backup file $Database_backup_file has been deleted"