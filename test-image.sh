#!/usr/bin/bash
# set username and password
UNAME="myjddocker"
UPASS="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"

function docker_tag_exists() {
    TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d '{"username": "'${UNAME}'", "password": "'${UPASS}'"}' https://hub.docker.com/v2/users/login/ | jq -r .token)
    curl --silent -f --head -lL https://hub.docker.com/v2/repositories/$1/tags/$2/ > /dev/null
}

if docker_tag_exists library/nginx 1.7.5; then
    echo exist
else 
    echo not exists
fi
