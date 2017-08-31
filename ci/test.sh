#!/usr/bin/env bash

parent_path=$( cd "$(dirname ${BASH_SOURCE[0]})" ; pwd -P )
source $parent_path/common.sh

if [ -n "$1" ]; then
	sourceFile "$1"
fi

log "Testing ${DOCKER_IMAGE}..."
CHECK=$(docker run -t --rm ${DOCKER_IMAGE} cat /etc/alpine-release )
rc=$?
if [ $rc -eq 0 ]; then
	CHECK_VER=$(echo ${CHECK} | cut -d. -f1,2 )
	EXPECTED_VER=$(echo ${TAG} | cut -d"-" -f1)
	if [ "$CHECK_VER" == "$EXPECTED_VER" ]; then 
		log "${DOCKER_IMAGE} tested"
	else
		log "[Error]: testing ${DOCKER_IMAGE} got $CHECK_VER expected $EXPECTED_VER"
		exit 1
	fi
else
	log "[Error]: running ${DOCKER_IMAGE}"
fi
exit $rc
