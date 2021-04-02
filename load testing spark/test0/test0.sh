#!/bin/bash

echo "Test 0 - Creazione file di input partendo da uno piccolo."

echo "Spazio residuo sul disco"

df -h

echo "Controllo dimensione del file"

ls -l -h

echo "Download del file big.txt..."

wget https://norvig.com/big.txt

echo "Download del file big.txt completato"

./createFile.sh
#sh createFile.sh

echo "Creazione del file completata"

echo "Spazio residuo sul disco dopo l'elaborazione effettuata"

df -h

echo "Controllo dimensione del file dopo l'elaborazione effettuata"

ls -l -h



