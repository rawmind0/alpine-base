#!/usr/bin/env bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path

source common.sh

log "Testing ${DOCKER_TAG}:${TAG}..."
CHECK=$(docker run -t --rm ${DOCKER_TAG}:${TAG} cat /etc/alpine-release )
rc=$?
if [ $rc -eq 0 ]; then
	CHECK_VER=$(echo ${CHECK} | cut -d. -f1,2 )
	if [ "$CHECK_VER" == "$VERSION" ]; then 
		log "${DOCKER_TAG}:${TAG} tested"
	else
		log "[Error]: testing ${DOCKER_TAG}:${TAG} got $CHECK_VER expected $VERSION"
		exit 1
	fi
fi
log "[Error]: running ${DOCKER_TAG}:${TAG}"
exit $rc
