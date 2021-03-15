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

select_first(driver)

html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')
matzip_list = soup.select('.placelist > .PlaceItem')

print(matzip_list)

# 현재 페이지의 html정보 가져오기
def get_content(driver):
          html = driver.page_source
          soup = BeautifulSoup(html, 'html.parser')

          #title
          try:
                    title = soup.select('.head_item > .tit_name > .link_name')[0].text
                    print(title)
          except:
                    title = ''
          #category
          try:
                    category = soup.select('.head_item > .subcategory')[0].text
          except:
                    category = ''
          #address
          try:
                    address = soup.select('.info_item > .addr > p')[0].text 
          except:
                    address = ''
          #time
          try:
                    time = soup.select('.openhour > .periodWarp > a')[0].text 
          except:
                    time = ''
          #contact
          try:
                    contact = soup.select('.contact > span.phone')[0].text 
          except:
                    contact = ''
          data = [title, address, category, time, contact]
          
          return data

result = get_content(driver)

print(result)






# def move_next(driver):
#           page = driver.find_element_by_css_selector('.pages > a')
#           page.click()
#           time.sleep(3)
# move_next(driver)

# results = []

# target= 500

# for i in range(target):
#           try:
#                     data = get_content(driver)
#                     results.append(data)
#                     move_next(driver)
#           except:
#                     time.sleep(2)
#                     move_next(driver)
# print(results[:2])
          


# for i, matTitle in matzip_list:
#           matzip_list = matTitle.select('.head_item>.tit_name>.link_name')[0].text #matzipname
#           detail_page_xpath = '//*[@id="info.search.place.list"]/li['+str(i+1)+']/div[5]/div[4]/a[1]'
#           driver.find_element_by_xpath(detail_page_xpath).send_keys(Keys.ENTER)
#           driver.switch_to.window(driver.window_handles[-1]) # 상세정보 탭으로 변환

#           html = driver.page_source
#           soup = BeautifulSoup(html,'html.parser')

#           # 첫 페이지 info 찾기
#           matAddrlist = soup.select('.details_placeinfo>span')

#           if len(matAddrlist) != 0:
#                     for j, matAddr in enumerate(matAddrlist):
#                      location = matAddr.select('.location_detail>span')
#                      driver.close()
#           driver.switch_to.window(driver.window_handles[0])

          
