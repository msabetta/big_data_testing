#!/bin/bash
DIM=500
FILE="dummy.txt"

echo "Creazione del file $FILE di dimensione $DIM in corso..."

for i in `seq 1 $DIM`;do cat big.txt  >> dummy.txt ; done

