#!/bin/bash -x

#This script can be used to change a Synapse user's password. It will also invalidate all active sessions (logging them out of all their devices), forcing a login
#with the new password. You must supply a username that has admin access to retrieve an appropriate access token.


echo "Enter your admin username: "
read ADMIN_NAME
echo "Enter your admin password: "
read -s ADMIN_PASS

echo "Enter the username to change: "
read SYNUSER_NAME
echo "Enter the user's new password: "
read SYNUSER_PASS

#login with admin creds and get a current access token for the actual password reset. the strange "'" quoting pattern is deliberate; this must be done to properly expand
#bash variables when in nested quotes
JSON_RESPONSE=$(curl -XPOST -d '{"type":"m.login.password", "user":"'"$ADMIN_NAME"'", "password":"'"$ADMIN_PASS"'"}' "http://localhost:8008/_matrix/client/r0/login")

#massage JSON body that is returned since we only care about the access token itself. strip off quotes as well
ACCESS_TOKEN2=$(echo "$JSON_RESPONSE" | grep access_token | awk -F "\"" '{print $4}')

#actually reset the user's password. new password is passed in a JSON response to the reset_password API, with the access token appended at the end
curl -XPOST -d '{"new_password":"'"$SYNUSER_PASS"'"}' http://localhost:8008/_synapse/admin/v1/reset_password/@$SYNUSER_NAME:shitlord.party?access_token=$ACCESS_TOKEN2