import os
from time import sleep
from bs4.element import ResultSet

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

select_first(driver)

html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')
matzip_list = soup.select('.placelist > .PlaceItem')

result = []

#print(matzip_list)

# 현재 페이지의 html정보 가져오기
def get_content(driver):

          html = driver.page_source
          soup = BeautifulSoup(html, 'html.parser')

          data = []

          for i, matzip in enumerate(matzip_list):
                  
                  title = matzip.select('.head_item > .tit_name > .link_name')[0].text
                  category = matzip.select('.head_item > .subcategory')[0].text
                  category = matzip.select('.head_item > .subcategory')[0].text
                  address = matzip.select('.info_item > .addr > p')[0].text 
                  time = matzip.select('.openhour > .periodWarp > a')[0].text 
                  contact = matzip.select('.contact > span.phone')[0].text

                  data += [title, address, category, time, contact]
          
          return data

result = get_content(driver)
print(result)

driver.find_element_by_xpath('//*[@id="info.search.place.more"]').send_keys(Keys.ENTER)
sleep(4)

data = []

for i in range(2, 6):
            # 페이지 넘기기
                  xPath = '//*[@id="info.search.page.no' + str(i) + '"]'
                  driver.find_element_by_xpath(xPath).send_keys(Keys.ENTER)
                  sleep(3)

                  html = driver.page_source
                  soup = BeautifulSoup(html, 'html.parser')
                  place_lists = soup.select('.placelist > .PlaceItem') # 장소 목록 list

                  #print(place_lists)

                  get_content(driver)

                  data += get_content(driver)


print(data)







# def firstpage(driver):
#           # 우선 더보기 클릭해서 2페이지
#       #     contents = []
#           try:
#                     driver.find_element_by_xpath('//*[@id="info.search.place.more"]').send_keys(Keys.ENTER)
#                     sleep(4)

#                     for i in range(2, 6):
#                               # 페이지 넘기기
#                               xPath = '//*[@id="info.search.page.no' + str(i) + '"]'
#                               driver.find_element_by_xpath(xPath).send_keys(Keys.ENTER)
#                               sleep(3)

#                               html = driver.page_source
#                               soup = BeautifulSoup(html, 'html.parser')
#                               place_lists = soup.select('.placelist > .PlaceItem') # 장소 목록 list

#                               print(place_lists)

#                               # get_content(driver)

#                               # contents += get_content(driver)

#           except ElementNotInteractableException:
#                     print('not found')
                    
#                   #   return contents












# idx = 3
# try:
#           page_num = len(driver.find_elements_by_class_name('link_page')) # 페이지 수 찾기
#           for i in range(page_num-1):
#                     # css selector를 이용해 페이지 버튼 누르기
#                     driver.find_element_by_css_selector('#mArticle > div.cont_evaluation > div.evaluation_review > div > a:nth-child(' + str(idx) +')').send_keys(Keys.ENTER)
#                     sleep(1)
                    
#                     idx += 1
#           driver.find_element_by_link_text('다음').send_keys(Keys.ENTER) # 5페이지가 넘는 경우 다음 버튼 누르기
#           sleep(1)
#           get_content(driver)
# except (NoSuchElementException, ElementNotInteractableException):
#           print("no review in crawling")

# # 그 이후 페이지
# while True:
#           idx = 4
#           try:
#                     page_num = len(driver.find_elements_by_class_name('link_page'))
#                     for i in range(page_num-1):
#                               driver.find_element_by_css_selector('#mArticle > div.cont_evaluation > div.evaluation_review > div > a:nth-child(' + str(idx) +')').send_keys(Keys.ENTER)
#                               sleep(1)
#                     get_content(driver)
#                     idx += 1
#                     driver.find_element_by_link_text('다음').send_keys(Keys.ENTER) # 10페이지 이상으로 넘어가기 위한 다음 버튼 클릭
#                     sleep(1)
#                     get_content(driver) # 맛집 정보
#           except (NoSuchElementException, ElementNotInteractableException):
#                 print("no review in crawling")
#                 break

# driver.close()
# driver.switch_to.window(driver.window_handles[0])  # 검색 탭으로 전환

