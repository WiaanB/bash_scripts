#!/bin/bash

printf "cURL examples and playground :)\n"

USERS=$(curl -XGET https://jsonplaceholder.typicode.com/users)

# print out the users pretty printed courtesy of jq
echo $USERS | jq '.'