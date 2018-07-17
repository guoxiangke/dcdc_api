#! /bin/bash
pwd
git pull && git commit -am 'auto commit' && git push
cp -vvv ./html/composer.json ./drupal/composer.json
cd ./drupal && git commit -am 'auto commit' && git push origin master
cd ../ && git commit -am 'auto commit' && git push origin master
ssh root@123.207.178.25<< EOF
cd /root/html/dcdc_api/ && chmod +x ./run.sh && ./run.sh
EOF
