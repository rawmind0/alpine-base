#!/usr/bin/env bash

function log {
    echo $ME - $@
}

function sourceFile {
    if [ -f "$1" ]; then
		source $1
	else 
		log "[Error]: File $1 don't exists."
	fi
}

function getRev {
	BUILD_VER=$(git tag --sort v:refname -l ${1}-* | tail -1)
	if [ -z "${BUILD_VER}" ]; then 
		rev=0
	else
		rev=$(echo ${BUILD_VER} | cut -d"-" -f2)
		if [ -z "${rev}" ]; then
			rev=0
		else
	    	((rev++))
	    fi
	fi
	echo $rev
}

parent_path=$( cd "$(dirname ${BASH_SOURCE[0]})" ; pwd -P )
cd $parent_path

VERSION=${VERSION:-$(cat version)}
DOCKER_USER=${DOCKER_USER:-"rawmind"}
DOCKER_NAME=${DOCKER_NAME:-"alpine-base"}

if [ -z "${TAG}" ]; then
	REVISION=$(getRev ${VERSION})
	TAG=${VERSION}"-"${REVISION}
fi

DOCKER_IMAGE=${DOCKER_IMAGE:-${DOCKER_USER}"/"${DOCKER_NAME}":"${TAG}}

cat << EOF > build_version
DOCKER_IMAGE=${DOCKER_IMAGE}
TAG=${TAG}
EOF