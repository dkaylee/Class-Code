#import urllib.request as req
from urllib import request
from bs4 import BeautifulSoup as bs
import re

target = request.urlopen('https://sports.news.naver.com/kbaseball/record/index.nhn?category=kbo')

soup = BeautifulSoup(target, 'html.parser')

print(soup.title)

print(soup.img['src'])

# 검색 함수
# find() : 해당 태그의 첫번째 태그의 정보만 반환
# find_all() : 여러개의 태그 정보를 반환 - list로 반환

# find() : 하나의 태그 추출
print(soup.find('a'))
print(soup.find('a', class_='logo'))
print(soup.find(id='team_LG'))

# 여러개 태그를 추출
tag_1 = soup.find_all(text=re.compile('순위'))
print(tag_1)

print('----------------------------------')
for tag in soup.find_all('a'):
          #print(tag)
          pass
for tag in soup.find_all('a', attrs={'class', 'logo'}):
          #print(tag)
          pass
for tag in soup.select('td>div>span[id]'):
          #print(tag.string)
          pass
for i, tag in soup.enumerate(soup.select('td>div>span[id]'), start=1):
          print(i,'위', tag.string)