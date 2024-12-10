DOCKER_RUN=docker run -it --workdir=/srv --rm --user=$(shell id -u) -v $(PWD):/srv
NODE_IMAGE=node:22
LOCAL_PORT=8000
node_modules: yarn.lock package.json
	$(DOCKER_RUN) $(NODE_IMAGE) yarn install

upgrade: yarn.lock package.json
	$(DOCKER_RUN) $(NODE_IMAGE) yarn upgrade
.PHONY: update

start_the_show: node_modules
	$(DOCKER_RUN) -p $(LOCAL_PORT):8000 --name gitgud $(NODE_IMAGE) /bin/sh -c 'npm start'
.PHONY: start_the_show

build: node_modules
	$(DOCKER_RUN) -p $(LOCAL_PORT):8000 --name gitgud $(NODE_IMAGE) /bin/sh -c 'npm run-script build'
.PHONY: build
