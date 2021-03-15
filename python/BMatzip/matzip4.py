import os
from time import sleep
from bs4.element import ResultSet

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import ElementNotInteractableException
from selenium.common.exceptions import StaleElementReferenceException
from bs4 import BeautifulSoup
import pandas as pd


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

def select_first(driver):
          first = driver.find_element_by_css_selector(".placelist").click
          time.sleep(3)

select_first(driver)

html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')
matzip_list = soup.select('.placelist > .PlaceItem')

result = []

#print(matzip_list)

# 현재 페이지의 html정보 가져오기
def get_content(driver):

        #   html = driver.page_source
        #   soup = BeautifulSoup(html, 'html.parser')

          data = []

          for i, matzip in enumerate(matzip_list):
                  
                  title = matzip.select('.head_item > .tit_name > .link_name')[0].text
                  category = matzip.select('.head_item > .subcategory')[0].text
                  category = matzip.select('.head_item > .subcategory')[0].text
                  address = matzip.select('.info_item > .addr > p')[0].text 
                  time = matzip.select('.openhour > .periodWarp > a')[0].text 
                  contact = matzip.select('.contact > span.phone')[0].text

                  data = [title, address, category, time, contact]

          
          return data

result = get_content(driver)
print(result)

results = []

driver.find_element_by_xpath('//*[@id="info.search.place.more"]').send_keys(Keys.ENTER)
sleep(4)

for i in range(2, 6):
            # 페이지 넘기기
                  xPath = '//*[@id="info.search.page.no' + str(i) + '"]'
                  driver.find_element_by_xpath(xPath).send_keys(Keys.ENTER)
                  sleep(3)

                  html = driver.page_source
                  soup = BeautifulSoup(html, 'html.parser')
                  matzip_list = soup.select('.placelist > .PlaceItem') # 장소 목록 list

                  #print(place_lists)

                  get_content(driver)

                  data = get_content(driver)
                  results.append(data)

                  #print(data)



print(results)







# 한과채', '서울 종로구 인사동10길 13', '채식뷔페', '월~토 11:30 ~ 20:30 · 브레이크타임 월~토 14:30 ~ 17:00', '02-720-2802'

# results =[
#         ['mat_title', 'mat_addr', 'mat_cate', 'mat_cont', 'mat_num']

#         ]












