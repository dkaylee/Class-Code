import os
from time import sleep
from bs4.element import ResultSet

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import ElementNotInteractableException
from selenium.common.exceptions import StaleElementReferenceException
from bs4 import BeautifulSoup
import time

options = webdriver.ChromeOptions()
options.add_argument('headless')
options.add_argument('lang=ko_KR')
chromedriver_path = "chromedriver"
driver = webdriver.Chrome('/usr/local/bin/chromedriver')  # chromedriver 열기


def get_content(place):
          search_area = driver.find_element_by_xpath('//*[@id="search.keyword.query"]')  # 검색 창
          search_area.send_keys(place)  # 검색어 입력
          driver.find_element_by_xpath('//*[@id="search.keyword.submit"]').send_keys(Keys.ENTER)  # Enter로 검색
          sleep(1)

          html = driver.page_source

          soup = BeautifulSoup(html, 'html.parser')
          place_list = soup.select('.placelist > .PlaceItem')

          crawling(place, place_list)
          search_area.clear()

          try:
                    driver.find_element_by_xpath('//*[@id="info.search.place.more"]').send_keys(Keys.ENTER)
                    sleep(1)
                    # 2~ 5페이지 읽기
                    for i in range(2, 6):
                              # 페이지 넘기기
                              xPath = '//*[@id="info.search.page.no' + str(i) + '"]'
                              driver.find_element_by_xpath(xPath).send_keys(Keys.ENTER)
                              sleep(1)

                              html = driver.page_source
                              soup = BeautifulSoup(html, 'html.parser')
                              place_lists = soup.select('.placelist > .PlaceItem') # 장소 목록 list

                              crawling(place, place_lists)

          except ElementNotInteractableException:
                    print('not found')
          finally:
                    search_area.clear()



def crawling(place, place_list):
          data =[]

          for i in enumerate(place_list):
                    title = place.select('.head_item > .tit_name > .link_name')[0].text
                    category = place.select('.head_item > .subcategory')[0].text
                    category = place.select('.head_item > .subcategory')[0].text
                    address = place.select('.info_item > .addr > p')[0].text 
                    time = place.select('.openhour > .periodWarp > a')[0].text 
                    contact = place.select('.contact > span.phone')[0].text
                    
          data = [title, address, category, time, contact]
          
          return data


driver.implicitly_wait(4)  # 렌더링 될때까지 기다린다 4초
driver.get('https://map.kakao.com/')  # 주소 가져오기

# 검색할 목록
place_infos = ['비건식당']

for i, place in enumerate(place_infos):
          # delay
          if i % 4 == 0 and i != 0:
                    sleep(5)
          print("#####", i)
          get_content(place)

driver.quit()
print("finish")


#print(matzip_list)

# 현재 페이지의 html정보 가져오기




      #     #title
      #     try:
      #               title = soup.select('.head_item > .tit_name > .link_name')[0].text
      #               print(title)
      #     except:
      #               title = ''
      #     #category
      #     try:
      #               category = soup.select('.head_item > .subcategory')[0].text
      #     except:
      #               category = ''
      #     #address
      #     try:
      #               address = soup.select('.info_item > .addr > p')[0].text 
      #     except:
      #               address = ''
      #     #time
      #     try:
      #               time = soup.select('.openhour > .periodWarp > a')[0].text 
      #     except:
      #               time = ''
      #     #contact
      #     try:
      #               contact = soup.select('.contact > span.phone')[0].text 
      #     except:
      #               contact = ''

          
          
         
# 페이지 넘기기
# def firstpage(driver):
#           # 우선 더보기 클릭해서 2페이지
#           contents = []
#           try:
#                     driver.find_element_by_xpath('//*[@id="info.search.place.more"]').send_keys(Keys.ENTER)
#                     sleep(1)
#                     for i in range(2, 6):
#                               # 페이지 넘기기
#                               xPath = '//*[@id="info.search.page.no' + str(i) + '"]'
#                               driver.find_element_by_xpath(xPath).send_keys(Keys.ENTER)
#                               sleep(1)

#                               html = driver.page_source
#                               soup = BeautifulSoup(html, 'html.parser')
#                               place_lists = soup.select('.placelist > .PlaceItem') # 장소 목록 list

#           except ElementNotInteractableException:
#                     print('not found')
                    
#                     return contents



# result = get_content(driver)
# print(result)








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

