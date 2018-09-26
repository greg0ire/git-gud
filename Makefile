NODE=docker run -it --workdir=/srv --rm --user=$(shell id -u) -v $(PWD):/srv
LOCAL_PORT=8000
node_modules: yarn.lock package.json
	$(NODE) node yarn install

start_the_show: node_modules
	$(NODE) -p $(LOCAL_PORT):8000 --name gitgud node /bin/sh -c 'npm start'