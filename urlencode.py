import urllib.parse

stringToDecode = input("Enter URL/string to encode: ")

decodedString = urllib.parse.quote(stringToDecode)

print (decodedString)