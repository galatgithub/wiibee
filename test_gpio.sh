#! /bin/bash
# Test gpio writing
# use : test_gpio [GPIO#]
echo "GPIO number ?"
read N_GPIO
#for i in `seq 1 10`;
#do
    gpio mode $N_GPIO out
    sleep 0.1
    gpio write $N_GPIO 0
    sleep 0.1
    gpio write $N_GPIO 1
    sleep 0.1
    python wiiboard.py
#    echo $i
#done
