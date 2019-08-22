#!/home/riotadmin/synapse/env/bin/python

import urllib.parse

stringToDecode = input("Enter URL/string to encode: ")

decodedString = urllib.parse.quote(stringToDecode)

print ("\n Encoded string: \n\n ", decodedString, "\n")
