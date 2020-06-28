require 'selenium-webdriver'
wait = Selenium::WebDriver::Wait.new(:timeout => 180000)
d = Selenium::WebDriver.for :chrome

# 受講生のURLを記入
url = "https://furima2020.herokuapp.com/" 

d.get(url)
d.find_element(:class,"purchase-btn").click
if /ログイン/ .match(d.page_source)
  puts "ログインしていない状態で商品出品ページへアクセスすると、ログインページへ遷移しました"
else
  puts "ログインしていない状態で商品出品ページへアクセスすると、ログインページへ遷移できませんでした"
end
d.find_element(:class,"second-logo").click


sleep 300