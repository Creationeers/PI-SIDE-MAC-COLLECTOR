#!/bin/bash

while true
do

#probequest killen
pdigetter=$(pgrep probequest)

sudo kill -SIGINT $pdigetter

#60 Sekunden scannen
sleep 60

done
