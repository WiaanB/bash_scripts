#!/bin/bash

printf "cURL examples and playground :)\n"

# Check if there were any arguments passed
if [ $# -eq 0 ]
then
    echo "No options selected, please choose at least one from 'GET', 'POST', 'PUT', and 'DELETE'."
    exit
fi

# Loop through all the arguments provided
for argument in $@
do
    if [ "$argument" == "GET" ]
    then
        # GET
        echo "Executing GET..."
        GET=$(curl -s -XGET https://jsonplaceholder.typicode.com/users)
        echo $GET | jq '. | map({id: .id, name: .name, email: .email, company: .company.name})'
    elif [ "$argument" == "POST" ]
    then
        # POST
        echo "Executing POST..."
        POST=$(curl -s -X POST https://jsonplaceholder.typicode.com/posts -H 'Content-Type: application/json' -d '{"title":"My new post", "body":"Lorem ipsom style beat", "userId": 1}')
        echo $POST | jq '. | {"message":"success", "id": .id, "title": .title, "body": .body}'
    else
        echo "Wrong options selected, please choose at least one from 'GET', 'POST', 'PUT', and 'DELETE'."
    fi
done