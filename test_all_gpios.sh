#! /bin/bash
# Test gpio writing
# use : test_gpio [GPIO#]
GPIOS="4 5 3 6 2 21 22 10"
#echo "GPIO number ?"
#read N_GPIO
echo "How many times ?"
read N_TIMES
for i in `seq 1 $N_TIMES`;
do
    for N_GPIO in $GPIOS; do
        gpio mode $N_GPIO out
        sleep 0.1
        gpio write $N_GPIO 0
        sleep 0.1
        gpio write $N_GPIO 1
        sleep 0.1
    done
   echo "$i"
   sleep 0.2
done
