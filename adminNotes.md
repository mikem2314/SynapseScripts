***RESETING A PASSWORD***
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