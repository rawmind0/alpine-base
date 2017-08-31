#!/usr/bin/env bash

parent_path=$( cd "$(dirname ${BASH_SOURCE[0]})" ; pwd -P )
source $parent_path/common.sh

if [ -n "$1" ]; then
	sourceFile "$1"
fi

CHECK_TAG=$(git tag -l ${TAG})

if [ -z "${CHECK_TAG}" ]; then 
	log "Building ${DOCKER_IMAGE}:..."
	docker build -t ${DOCKER_IMAGE} ../ 
	rc=$?
	if [ $rc -eq 0 ]; then
		log "OK"
	else
		log "[Error]: building ${DOCKER_IMAGE}"		
	fi
	exit $rc
else
	log "[Error]: git tag ${TAG} already exists"
	exit 1
fi