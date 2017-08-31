#!/usr/bin/env bash

source common.sh

CHECK_TAG=$(git tag -l ${TAG})
if [ -z "${CHECK_TAG}" ]; then 
	log "Building ${DOCKER_TAG}:${TAG}..."
	docker build -t ${DOCKER_TAG}:${TAG} ../ 
	rc=$?
	if [ $rc -eq 0 ]; then
		log "OK"
	else
		log "[Error]: building ${DOCKER_TAG}:${TAG}"		
	fi
	exit $rc
else
	log "[Error]: git tag ${TAG} already exists"
	exit 1
fi