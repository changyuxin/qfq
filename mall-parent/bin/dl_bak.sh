#! /bin/sh
#dl images
scp 101.200.234.70:/data/images_data_bak/images_`date +%Y-%m-%d`.tar.gz /home/images_data_bak/
#dl db
scp 101.200.234.70:/data/mysql_data_bak/qfq_`date +%Y-%m-%d`.tar.gz /home/mysql_data_bak/