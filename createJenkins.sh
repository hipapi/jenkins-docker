#!/bin/bash
set -e
JENKINS_NAME=${JENKINS_NAME:-jenkins}
JENKINS_VOLUME=${JENKINS_VOLUME:-jenkins-volume}
GERRIT_NAME=${GERRIT_NAME:-gerrit}
JENKINS_IMAGE_NAME=${JENKINS_IMAGE_NAME:-openfrontier/jenkins}
JENKINS_OPTS=${JENKINS_OPTS:---prefix=/jenkins}

# Create Jenkins volume.
docker run \
--name ${JENKINS_VOLUME} \
${JENKINS_IMAGE_NAME} \
echo "Create Jenkins volume."

# Start Jenkins.
docker run \
--name ${JENKINS_NAME} \
-p 8080:8080 \
-p 50000:50000 \
--volumes-from ${JENKINS_VOLUME} \
-d ${JENKINS_IMAGE_NAME} ${JENKINS_OPTS}
