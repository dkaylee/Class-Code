from BMatzip.crawling_ex import crawling
import os
from time import sleep

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import ElementNotInteractableException
from selenium.common.exceptions import StaleElementReferenceException
from bs4 import BeautifulSoup


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


html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')
place_lists = soup.select('.placelist > .PlaceItem')

print(place_lists)


# 현재 페이지의 html정보 가져오기
# 1번페이지
def get_more_content(driver):
          html = driver.page_source
          soup = BeautifulSoup(html, 'html.parser')
          place_lists = soup.select('.placelist > .PlaceItem')

          get_content(driver)
          
          # 더보기 클릭
          try:
              driver.find_element_by_xpath('//*[@id="info.search.place.more"]').send_keys(Keys.ENTER)
              sleep(1)

            #page 2-34
              for i in range(2, 35):
                  xPath = '//*[@id="info.search.page.no' + str(i) + '"]'
                  driver.find_element_by_xpath(xPath).send_keys(Keys.ENTER)
                  sleep(1)

                  html = driver.page_source
                  soup = BeautifulSoup(html, 'html.parser')
                  place_lists = soup.select('.placelist > .PlaceItem') # 장소 목록

                  get_content(driver, place_lists)


# 현재 페이지의 html정보 가져오기
def get_content(driver):
          html = driver.page_source
          soup = BeautifulSoup(html, 'html.parser')
          
          #title
          try:
                    title = soup.select('.head_item > .tit_name > .link_name')[i].text
                    print(title)
          except:
                    title = ''
          #category
          try:
                    category = soup.select('.head_item > .subcategory')[i].text
          except:
                    category = ''
          #address
          try:
                    address = soup.select('.info_item > .addr > p')[i].text 
          except:
                    address = ''
          #time
          try:
                    time = soup.select('.openhour > .periodWarp > a')[i].text 
          except:
                    time = ''
          #contact
          try:
                    contact = soup.select('.contact > span.phone')[i].text 
          except:
                    contact = ''
          
          data = [title, address, category, time, contact]
          
          return data

result = get_content(driver)

print(result)      