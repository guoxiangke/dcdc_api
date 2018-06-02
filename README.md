# docker-compose run Drupal 8 with drupal-composer/drupal-project

## build it!
	docker build -t="drupal:composer" .
## start it
	docker-compose -p ddAPI up -d  --build --remove-orphans --force-recreate
## stop it
	docker-compose -p drupal8 down


## simplehtmldom libraries bug!
    docker cp helper.inc ddapi_drupal_1:/var/www/drupal/web/modules/contrib/simplehtmldom/helper.inc