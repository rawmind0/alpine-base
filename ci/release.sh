#!/usr/bin/env bash

parent_path=$( cd "$(dirname ${BASH_SOURCE[0]})" ; pwd -P )
source $parent_path/common.sh

if [ -n "$1" ]; then
	sourceFile "$1"
fi

log "Finding ${DOCKER_IMAGE} ..."
list_image=$(docker images -q ${DOCKER_IMAGE})
checkError $?

exist_image=$(echo $list_image | wc -l)
if [ "$exist_image" -ne "1" ]; then
	log "Loading ${DOCKER_IMAGE}..."
	docker load -i ${DOCKER_FILE}
	checkError $?
fi

log "Login to docker registry as ${DOCKER_USER} ..."
docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
checkError $?

log "Pushing ${DOCKER_IMAGE} ..."
docker push ${DOCKER_IMAGE}
checkError $?

log "Tagging git repo ${TAG} ..."
git tag ${TAG}
checkError $?

log "Pushing git tags ${TAG} ..."
git push origin master --tags
checkError $?

log "OK"
exit 0
