#!/bin/bash

echo "Cosa vuoi fare?(CREAeps/CREApng/RIMUOVIeps/RIMUOVIpng/RIMUOVItxt/CONTA)"
read ORDINE

CREAeps="CREAeps"
CREApng="CREApng"
RIMUOVIeps="RIMUOVIeps"
RIMUOVIpng="RIMUOVIpng"
RIMUOVItxt="RIMUOVItxt"
CONTA="CONTA"

if [ "$ORDINE" == "$CREAeps" ]; then
	#Creo le liste di file che voglio convertire
	ls *.png > files_png.txt
	sed 's/.png/.eps/' files_png.txt > files_eps.txt
	sed 's/.png//' files_png.txt > files.txt
	#Determino il numero di file
	NFILE=`find *.png -type f | wc -l`
	for((i=1;i<=$NFILE;i++));do convert `sed -n "$i"p files_png.txt` `sed -n "$i"p files_eps.txt`; done

else if [ "$ORDINE" == "$CREApng" ]; then
	ls *.eps > files_eps.txt
	sed 's/.eps/.png/' files_eps.txt > files_png.txt
	sed 's/.eps//' files_eps.txt > files.txt
	NFILE=`find *.eps -type f | wc -l`
	for((i=1;i<=$NFILE;i++));do convert `sed -n "$i"p files_eps.txt` `sed -n "$i"p files_png.txt`; done

else if [ "$ORDINE" == "$RIMUOVIeps" ]; then
	rm -f files*
	rm -f *.eps

else if [ "$ORDINE" == "$RIMUOVIpng" ]; then
	rm -f files*
	rm -f *.png

else if [ "$ORDINE" == "$RIMUOVItxt" ]; then
	rm -f *.txt

else if [ "$ORDINE" == "$CONTA" ]; then
	echo "Numero file png"
	find *.png -type f | wc -l
	echo "Numero file eps"
	find *.eps -type f | wc -l
	echo "Numero file txt"
	find *.txt -type f | wc -l
fi
fi
fi
fi
fi
fi
