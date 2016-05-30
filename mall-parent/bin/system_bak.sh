#!/bin/sh

# bak database
echo "=================================== bak database start ==================================="
mysqldump -uroot -pQinfenqi@2015 qfq | gzip > /data/mysql_data_bak/qfq_`date +%Y-%m-%d`.tar.gz
echo "=================================== bak database stop ==================================="

# bak images
echo "=================================== bak images start ==================================="
tar -czf /data/images_data_bak/images_`date +%Y-%m-%d`.tar.gz /root/apache-tomcat-7.0.62/webapps/images/
echo "=================================== bak images start ==================================="
