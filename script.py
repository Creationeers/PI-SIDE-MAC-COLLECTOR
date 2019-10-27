import csv
import json
from decouple import config
import requests

csvfile = open('data.csv', 'r')
jsonfile = open('data.json', 'w')

totalrows = len(open('data.csv').readlines())
print(totalrows)
fieldnames = ("Timestamp", "MAC-Address","Vendor","SSID")
reader = csv.DictReader( csvfile, fieldnames, delimiter=';')

l = list(reader)
count = 0
result = {i['MAC-Address']:i for i in reversed(l)}.values()
for x in result:
    count = count +1

r = requests.post(config("URL"), json={"count": count, "id": config("ID")})
