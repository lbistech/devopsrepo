#!/bin/bash

echo "------------------------------"
echo "=== Taking Database backup ==="
echo "------------------------------"

db_user=$1
db_password=$2
db_name=$3
s3_bucket_name=$4
aws_access_key=$5
aws_secret_key=$6
aws_region=$7
date=$(date +"%m-%d-%y-%H-%M-%S")
path="/tmp/$db_name-$date.sql"

export AWS_ACCESS_KEY_ID=$aws_access_key
export AWS_SECRET_ACCESS_KEY=$aws_secret_key
export AWS_DEFAULT_REGION=$aws_region

echo "--- Taking database $db_name dump ---"
mysqldump -u $db_user -p$db_password $db_name > $path

echo "--- Uploading the dump file to the aws s3 bucket ---"
aws s3 cp $path s3://$s3_bucket_name
