#!/bin/bash
if [ $# != 1 ];then
    echo "need a redis output file"
    exit 1
fi

cat $1 | sed 's/"//g' | awk -F, 'BEGIN{sum=0;cnt=0}{if(NR%5==0){sum+=$2;cnt+=1}} END{printf("avg=%.2f\n",sum/cnt)}'
