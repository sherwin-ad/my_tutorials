#!/bin/bash

crumb=$(curl -u "jenkins:1234" -s 'http://jenkins.local:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')


# Without parameters
# curl -u "jenkins:111e17fdc836926be8a0f3ad0291be3a83" -H "$crumb" -X POST http://jenkins.local:8080/job/ENV/build?delay=0sec



# With parameters
curl -u "jenkins:111e17fdc836926be8a0f3ad0291be3a83" -H "$crumb" -X POST  http://jenkins.local:8080/job/ansible-users-db/buildWithParameters?AGE=22

