Provisioning a new site
=======================

## Required packages

* nginx
* Python 3.6
* virtualenv + pip
* Git

eg on Ubuntu:
	sudo add-apt-repository ppa:deadsnakes/ppa
	sudo apt-get install nginx git python3.6 python3.6-env

## Nginx Virtual Host Config

* see nginx.template.conf
* replace SITENAME with e.g. staging.my-domain.com

## Folder structure
Assume we have a user account at /home/username/

/home/username/
+-- sites
    +-- SITENAME
	+-- database
	+-- source
	+-- static
	+-- virtualenv
