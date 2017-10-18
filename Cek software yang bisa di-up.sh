#!/bin/bash
#

echo "Selamat datang di program Upgrade Otomatis"

echo -n "Apakah Anda ingin melanjutkan (y/n)?"


read answer

if echo "$answer" | grep -iq "^y" ;
then

info=`apt list --upgradable` 

#Menampilkan daftar software yang upgradable

for x in $info;
	do echo $x;

done


fi