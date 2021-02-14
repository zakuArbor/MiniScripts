#!/bin/bash

rm data.sql

sql_files=('record.sql' 'email.sql' 'report.sql' 'store.sql' 'type.sql' 'um.sql' 'users.sql')
for ((i=0; i<${#sql_files[*]}; i++)); 
do
	echo "##DATA FOR ${sql_files[i]}##" >> data.sql
	cat ${sql_files[i]} >> data.sql
done