#!/bin/bash

#Monitor Mode aktivieren
#check if already in monitor mode if so skip

while true
do

sudo airmon-ng check kill
sudo airmon-ng start wlp10s0

#probequest starten
 
sudo konsole -e ./callprob.bash

# --- KILLER --- #

#Zurück zum Managed Mode
sudo iw dev wlp10s0mon del
sudo iw phy phy0 interface add wlp10s0 type managed
sudo iwconfig wlp10s0mon mode managed
sudo ifconfig wlp10s0 up
sudo service network-manager restart

sleep 10s

#UPLOAD zu Server
python3 script.py

#Löschen der Datei probes.csv
sudo rm data.csv

done
