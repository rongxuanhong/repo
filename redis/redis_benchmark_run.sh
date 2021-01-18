#!/bin/bash -e
if [ $# != 1 ];then
    echo "pass the arguments of an output filename."
    exit 1
fi
if [ ! -f $1 ];then
    rm -f $1
fi

for ((i=1;i<=100;++i))
do
    echo "The current iteration is $i/100"
    taskset -c 1 /home/hrx/install/redis-4.0.11/src/redis-benchmark -n 1000000 -r 1000000 -t set,get,hset,lpush,rpop -d 1024 --csv >>$1
done

