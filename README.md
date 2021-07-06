# Node with Gulp

This is a Born-Digital custom built image that is used for SASS compiling on Drupal 8 projects.

## Versions

* [Node Docker image](https://hub.docker.com/_/node) is [node:10.16-alpine](https://hub.docker.com/layers/node/library/node/10.16-alpine/images/sha256-6933efc3dc22d93dce68ecb0a08851a8c74307ca008aa895db9967fa492a376a?context=explore)
  * Not [current](https://github.com/nodejs/docker-node/blob/fe99ef04dc64df51749ff9120794b3b949d56ee5/16/alpine3.11/Dockerfile) (_as of 7/6/2021_)

* [Node](https://github.com/nodejs/node) is held at: `10.16`
  * Not [current](https://nodejs.org/en/about/releases/) (_as of 7/6/2021_)

* [gulp-cli](https://www.npmjs.com/package/gulp-cli) is held at: `2.3.0`
  * (_stable release as of 7/6/2021_)

* [gulp](https://github.com/gulpjs/gulp/releases/tag/v4.0.2) is held at: `4.0.2`
  * (_stable release as of 7/6/2021_)

To upgrade, change the following lines within the `Dockerfile`

* Line 1: `FROM node:10.16-alpine` to an [Alpine](https://hub.docker.com/_/alpine) based image of your choice
* Line 33: `GULP_CLI_VERSION:-2.3.0}` change the `2.3.0` to a numeric value of your choice
* Line 34: `GULP_VERSION:-4.0.2}` change the `4.0.2` to a numeric value of your choice

## Files

* Dockerfile syntax and style was inspired by the Archipelago project i.e. [esmero-catmandu](https://github.com/esmero/archipelago-docker-images/blob/main/esmero-catmandu/Dockerfile)

* [entrypoint.sh](https://github.com/nodejs/docker-node/blob/main/docker-entrypoint.sh) script was used from the official Node [Docker image](https://github.com/nodejs/docker-node)

## To build this image

* `docker build -t borndigital/node-gulp .`

## To use this image in a command line

* Install NPM dependencies including Bootstrap etc.
  * `docker run --rm -v $PWD/web/themes/custom/custom_theme:/custom_theme -w /theme -i -t borndigital/node-gulp:1.0 npm install`

* Run `gulp styles` to compile SASS
  * `docker run --rm -v $PWD/web/themes/custom/custom_theme:/custom_theme -w /theme -i -t borndigital/node-gulp:1.0 gulp styles`

## Add these lines to a Makefile

```bash
sass:
	docker run --rm -v ${PWD}/web/themes/custom/custom_theme:/custom_theme -w /custom_theme -i -t borndigital/node-gulp:1.0 npm install
	docker run --rm -v ${PWD}/web/themes/custom/custom_theme:/custom_theme -w /custom_theme -i -t borndigital/node-gulp:1.0 gulp styles
```
