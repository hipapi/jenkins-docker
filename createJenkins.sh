#!/bin/bash
set -e
JENKINS_NAME=${JENKINS_NAME:-jenkins-master}
GERRIT_NAME=${GERRIT_NAME:-gerrit}
JENKINS_IMAGE_NAME=openfrontier/jenkins
LOCAL_VOLUME=~/jenkins_volume
mkdir -p "${LOCAL_VOLUME}"
docker run --name $JENKINS_NAME --link $GERRIT_NAME:gerrit -p 8088:8080 -v ${LOCAL_VOLUME}:/var/jenkins_home -d ${JENKINS_IMAGE_NAME}
