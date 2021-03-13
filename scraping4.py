import requests
from bs4 import BeautifulSoup
#print("hello")

url = 'https://onlineradiobox.com/ru/radiorecord/'
response = requests.get(url)
soup = BeautifulSoup(response.text, 'lxml')
quotes = soup.find_all('section', class_='station-onair')
#quotes = soup.find_all('table', class_='tablelist-schedule')

#for quote in quotes:
#    with open("record_title_music.txt", "w") as record:
#       record.write(quote.text)
#record = open('record_title_music.txt', 'w')
for quote in quotes:
    print(quote.text)
#record.close()
