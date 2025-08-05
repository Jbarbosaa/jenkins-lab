#!/bin/bash

DATE=$(date +%y-%m-%d)
BACKUP=db-$DATE.sql

SQL_HOST=$1
DB_PASSWD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5

echo "Dump in progress"

mysqldump -u root -h $SQL_HOST -p$DB_PASSWD $DB_NAME > /tmp/$BACKUP

export AWS_ACCESS_KEY_ID=AKIATDBHYTOU6GYIWO7L && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \

echo "Uploading your db $BACKUP" && \
aws s3 cp /tmp/$BACKUP s3://$BUCKET_NAME/$BACKUP