#!/bin/bash
#
Update dan Upgrade berdasarkan penjadwalan lalu ditampilkan apa yang sudah diupdate

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



echo -n "Apakah Anda ingin menginstall semua update tersebut (y/n)?"

read answer2

if echo "$answer2" | grep -iq "^y" ;
then

if [ $(id -u) = 0 ];
then #pengecekan user 
root
apt-get install unattended-upgrades
dpkg-reconfigure unattended-upgrades

if apt-get upgrade -y; 
then
    
echo "$(date): Update Anda berhasil" >> hasil.txt
	

cat /var/log/apt/history.log >> hasil.txt
else
    
echo "$(date): Update Anda gagal" >> hasil.txt
	
cat /var/log/apt/history.log >> hasil.txt
fi

elif [ $(id -u) != 0 ];
then

echo "Anda harus masuk ke user root"

fi

fi

fi

