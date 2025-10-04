#!/bin/bash
#
echo "==========================="
echo "=== MySQL Backup Script ==="
echo "==========================="

mysql_user=$1
mysql_password=$2
mysql_db=$3
s3_bucket_name=$4

Database_backup_file=$mysql_db-$(date +'%d%m%Y'-'%H%M%S').sql

echo "First Time backup file name is $Database_backup_file"

mysqldump -u $mysql_user $mysql_db -p$mysql_password > $Database_backup_file
echo "Successully Backup Has been Generated"
aws s3 cp $Database_backup_file s3://$s3_bucket_name
echo "Successfully upload to the AWS S3 bucket"

echo "Second Time backup file name should be $Database_backup_file"

echo "--- Deleting backup from local server ---"
rm -f /home/ubuntu/$Database_backup_file
echo "The backup file $Database_backup_file has been deleted"