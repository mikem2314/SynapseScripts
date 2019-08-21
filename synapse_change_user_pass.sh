#!/bin/bash -x

echo "Enter your admin username: "
read ADMIN_NAME
echo "Enter your admin password: "
read -s ADMIN_PASS

echo "Enter the username to change (format MUST be @username:shitlord.party)"

read SYNUSER_NAME

echo "Enter the user's new password"
read SYNUSER_PASS

#echo "fcurl -XPOST -d '{\"type\":\"m.login.password\", \"user\":\"$ADMIN_NAME\", \"password\":\"$ADMIN_PASS\"}' "http://localhost:8008/_matrix/client/r0/login""

JSON_RESPONSE=$(curl -XPOST -d '{"type":"m.login.password", "user":"'"$ADMIN_NAME"'", "password":"'"$ADMIN_PASS"'"}' "http://localhost:8008/_matrix/client/r0/login")

#echo $JSON_RESPONSE

ACCESS_TOKEN2=$(echo "$JSON_RESPONSE" | grep access_token | awk -F "\"" '{print $4}')

#echo $ACCESS_TOKEN2

curl -XPOST -d '{"new_password":"'"$SYNUSER_PASS"'"}' http://localhost:8008/_synapse/admin/v1/reset_password/@$SYNUSER_NAME:shitlord.party?access_token=$ACCESS_TOKEN2