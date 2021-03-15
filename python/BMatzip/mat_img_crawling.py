from matzip4 import kakao_searching
from urllib.request import urlopen
from bs4 import BeautifulSoup as bs
from urllib.parse import quote_plus
import pandas as pd
import numpy as np

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
import time


df = pd.read_csv('b_matzip.csv')

print(df)

#column 0번지만 출력
df = df['0']

print(df)

df.columns = ['name']

#포털의 리뷰와 별점을 가져온다
driver = webdriver.Chrome('/usr/local/bin/chromedriver')

df['kakao_keyword'] = df['name']
df['kakao_map_url'] = ''

# for i, keyword in enumerate(df['kakao_keyword'].tolist()):
#           print("이번에 찾을 키워드 :", i, f"/ {df.shape[0]} 행", keyword)
#           try:
#                     kakao_map_search_url = f"https://map.kakao.com/?q={keyword}"
#                     driver.get(kakao_map_search_url)
#                     time.sleep(3.5)
#                     df.iloc[i,-1] = driver.find_element_by_css_selector("#info\.search\.place\.list > li:nth-child(1) > div.info_item > div.contact.clickArea > a.moreview").get_attribute('href')
#           except Exception as e1:
#                     if "li:nth-child(1)" in str(e1):  # child(1)이 없던데요?
#                               try:
#                                         df.iloc[i,-1] = driver.find_element_by_css_selector("#info\.search\.place\.list > li > div.info_item > div.contact.clickArea > a.moreview").get_attribute('href')
#                                         time.sleep(1)
#                               except Exception as e2:
#                                         print(e2)
#                                         df.iloc[i,-1] = np.nan
#                                         time.sleep(1)
#                     else:
#                               pass

driver = webdriver.Chrome('/usr/local/bin/chromedriver')

import time

driver.get('https://map.kakao.com')
time.sleep(2)

def kakao_searching(word):
          url = "https://map.kakao.com/?q=" + word
          return url

word = '비건식당'
url = kakao_searching(word)
driver.get(url)

baseUrl = "https://map.kakao.com/?q=" + plusUrl
plusUrl = input('검색어를 입력하세요 : ')
# 한글 검색 자동 변환
url = baseUrl + quote_plus(plusUrl)
html = urlopen(url)
soup = bs(html, "html.parser")
img = soup.find_all(class_='_img')

n = 1
for i in img:
    imgUrl = i['data-source']
    with urlopen(imgUrl) as f:
        with open('./img/' + plusUrl + str(n)+'.jpg','wb') as h: # w - write b - binary
            img = f.read()
            h.write(img)
    n += 1
print('다운로드 완료')

