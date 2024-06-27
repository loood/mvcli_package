#!/bin/bash
set -xe
apt-get update
apt-get install -y wget unzip
wget -O mvcli-4.1.13.31_A01.zip -U "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)" "https://dl.dell.com/FOLDER04572610M/1/mvcli 4.1.13.31_A01.zip" 
unzip mvcli-4.1.13.31_A01.zip
mv 'mvcli 4.1.13.31_A01'/ mvcli-4.1.13.31_A01/
cd mvcli-4.1.13.31_A01
mkdir -p dst/lib dst/usr/bin
install -m 644 x64/lib/libmvraid.so dst/lib/libmvraid.so
install -m 755 x64/cli/mvcli dst/usr/bin/mvcli

fpm -s dir -t deb -n mvcli -v 4.1.13.31-A01 -a amd64 -C dst lib usr/bin
cp *.deb /deb_dist/
