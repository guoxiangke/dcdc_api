#! /bin/bash
# usage:
# sh run.sh staging
# sh run.sh production
if [ -z "$1" ]
then
  stage="development"
else
  stage=$1
fi
echo $stage
git checkout .
git pull origin master
git submodule foreach git checkout .
git submodule foreach git pull origin master
ProjectName="ddApi"
docker-compose -f docker-compose-$stage.yml -p $ProjectName down --remove-orphans
docker-compose -f docker-compose-$stage.yml -p $ProjectName  up -d  --build --remove-orphans --force-recreate
docker restart a-nginx a-nginx-gen
docker-compose -p $ProjectName restart drupal
sleep 5
docker restart a-nginx
