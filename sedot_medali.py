#!/usr/bin/python
# Sedot medali abal-abal
# Using 'requests' and `BeautifulSoup`
# /ialexs
# Mon Aug 20 16:42:45 WIB 2018

# import perabotan
from requests import get
from bs4 import BeautifulSoup

# Target URL - Using IOC country code - https://en.wikipedia.org/wiki/List_of_IOC_country_codes
# url = 'https://en.asiangames2018.id/medals/noc/CHN'
url = 'https://en.asiangames2018.id/medals/noc/INA'

# Target URL for testing on localhost - buat latihan
# url = 'http://localhost:8080/INA.html'

# Play 'nice' giving common header :)
headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'}
response = get(url,headers=headers)

# Peek output - just to make sure
#print(response.text[:700])

# Get the response
html_soup = BeautifulSoup(response.text,'html.parser')
type(html_soup)

# Get the container/div
gold_count_container    = html_soup.find_all('span',class_ = 'or-medal-number or-g-m')
silver_count_container  = html_soup.find_all('span',class_ = 'or-medal-number or-s-m')
bronze_count_container  = html_soup.find_all('span',class_ = 'or-medal-number or-b-m')

gold_count=gold_count_container[0]
silver_count=silver_count_container[0]
bronze_count=bronze_count_container[0]

# Spit it
print gold_count
print silver_count
print bronze_count

