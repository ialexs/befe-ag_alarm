#!/bin/bash
# Sedot medali Asian Games abal-abal
# Using Python 'requests' and `BeautifulSoup`
#
# If found new medal for Indonesia, play IndonesiaRaya.mp3
# wkwkwkwk
#
# /ialexs Mon Aug 20 16:42:45 WIB 2018

# my fav date
date=`date +%Y%m%d-%0k%M%S`

echo $date >> .log.txt

# sedotan_py - python script
sedotan_py="
# import perabotan lenong
from requests import get
from bs4 import BeautifulSoup

# Target URL - Using IOC country code https://en.wikipedia.org/wiki/List_of_IOC_country_codes
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

# Get the container/div from URL
gold_count_container    = html_soup.find_all('span',class_ = 'or-medal-number or-g-m')
silver_count_container  = html_soup.find_all('span',class_ = 'or-medal-number or-s-m')
bronze_count_container  = html_soup.find_all('span',class_ = 'or-medal-number or-b-m')

gold_count=gold_count_container[0]
silver_count=silver_count_container[0]
bronze_count=bronze_count_container[0]

# Spit it
print
print gold_count
print silver_count
print bronze_count
"
# sedotan_py end
#


if [ -e latest.dat ]; then
    	echo "File 'latest.dat' exists. Fetch new data & compare with 'latest.dat'"

		# get new data
		python -c "$sedotan_py" | tee medali-$date.dat

		# compare the new data with 'latest.dat'
		if [ `md5sum latest.dat |awk '{print $1}'` = `md5sum medali-$date.dat | awk '{print $1}'` ]; then
			# Data sama. Medali kagak nambah
			echo -e "\nData are the same... - no new medal :( - exit"
			rm -rf medali-$date.dat

		else
			# Data beda. Medali nambah. Horee
			echo -e "\nData diff from last one. Delete old 'latest.dat' & create new one.."
			rm -rf `readlink latest.dat` ; rm -rf latest.dat
			ln -s medali-$date.dat latest.dat

			echo -e "\nMedali nambahhh..!\n... Play Indonesia Rayaaa..." | tee -a .log.txt ;
			play -q 09-Simphoni-1Stanza-30sec.wav
		fi

else
    	echo -e "File latest.dat does not exist. Go fetch from URL & symlink it as latest.dat"
	echo -e "\nFetch https://en.asiangames2018.id/medals/noc/INA ..."
    	python -c "$sedotan_py" | tee medali-$date.dat ; ln -s medali-$date.dat latest.dat
	echo -e "..done"
fi

# udin
