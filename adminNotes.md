***RESETING A PASSWORD***

NOTE: See farther down for the script that resets a user's password over the Synapse API. This is quicker and safer than manually editing the DB.

~/synapse/env/bin/hash_password
Password:
Confirm password:
$2a$12$xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

take hash from above and become postgress user and connect to db using "psql -U synapse_user synapse"

the password "changeme" is the follow hash:
$2b$12$S2yppEDnySKGBIgTIkIQhemCB.HmmUxQwVT7XBLwcRf.4y0kHv3HK 

UPDATE users SET password_hash='$2a$12$xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
WHERE name='@<userID>:shitlord.party';

*** Resetting a user's password over API ***

Use the change_user_pass.sh script under /home/riotadmin/admin_scripts. 

***TOGGLE USER ADMINISTRATION***

UPDATE users SET admin = 1 WHERE name = '@<roomName>:shitlord.party'

*** URL Encoding ***

Some API commands, such as creating rooms or inviting users to rooms, require the room-alias/ID to be properly URL encoded. There is a python script
located under admin_scripts in the riotadmin home directory named "urlencode.py" that can do this encode for you. Simply execute the script and follow
the prompts.