	#! /bin/bash
	ProjectName="ddApi"
	git checkout .
	git pull origin master
	git submodule foreach git checkout .
	git submodule foreach git pull origin master

	docker-compose -p $ProjectName down --remove-orphans
	docker-compose -p $ProjectName  up -d  --build --remove-orphans --force-recreate

	docker restart a-nginx a-nginx-gen
	docker-compose -p $ProjectName restart drupal
	sleep 5
	docker restart a-nginx
