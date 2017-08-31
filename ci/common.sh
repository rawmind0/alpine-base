#!/usr/bin/env bash

function log {
        echo $ME - $@
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

VERSION=${VERSION:-$(cat version)}
DOCKER_USER=${DOCKER_USER:-"rawmind"}
DOCKER_NAME=${DOCKER_NAME:-"alpine-base"}
DOCKER_TAG=${DOCKER_TAG:-${DOCKER_USER}"/"${DOCKER_NAME}}

if [ -z "${TAG}" ]; then
	REVISION=$(getRev ${VERSION})
	TAG=${VERSION}"-"${REVISION}
fi

cat << EOF > build_version
VERSION=${VERSION}
DOCKER_USER=${DOCKER_USER}
DOCKER_TAG=${DOCKER_TAG}
TAG=${TAG}
EOF