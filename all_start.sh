#!/bin/bash

export LOG=/srv/project1.log 
cd /srv
echo "--------------- START ---------------" >> $LOG
echo $(date +"%F %H:%M:%S") >> $LOG
echo "---- sync start ----" >> $LOG
make sync >> $LOG
echo "---- build start ----" >> $LOG
make build >> $LOG
echo "---- deploy start ----" >> $LOG
make deploy ip=$1 >> $LOG
echo "--------------- END ---------------" >> $LOG
