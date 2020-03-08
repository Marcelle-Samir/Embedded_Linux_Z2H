#!/bin/sh
mp3_player(){
modprobe snd-bcm2835 
echo "26" >> /sys/class/gpio/export
echo "in" >> /sys/class/gpio/gpio26/direction

echo "19" >> /sys/class/gpio/export
echo "in" >> /sys/class/gpio/gpio19/direction

echo "13" >> /sys/class/gpio/export
echo "in" >> /sys/class/gpio/gpio13/direction

echo "6" >> /sys/class/gpio/export
echo "in" >> /sys/class/gpio/gpio6/direction

while :
do
	if [ $(cat /sys/class/gpio/gpio26/value) -eq 1 ]
	then
		mpg123 -vC /myApplications/abtal_el_digital.mp3


	elif [ $(cat /sys/class/gpio/gpio19/value) -eq 1 ]
	then
		mpg123 -s

	elif [ $(cat /sys/class/gpio/gpio13/value) -eq 1 ]
	then
		mpg123 -vC /myApplications/Some_Things_Never_Change.mp3


	elif [ $(cat /sys/class/gpio/gpio6/value) -eq 1 ]
	then
		mpg123 -vC /myApplications/Into_the_Unknown.mp3
	fi
done
}
mp3_player
