require 'selenium-webdriver'
wait = Selenium::WebDriver::Wait.new(:timeout => 180000)
d = Selenium::WebDriver.for :chrome

# 受講生のURLを記入
url = "https://furima2020.herokuapp.com/" 

d.get(url)

sleep 300