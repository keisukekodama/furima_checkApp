require 'selenium-webdriver'
wait = Selenium::WebDriver::Wait.new(:timeout => 180000)
d = Selenium::WebDriver.for :chrome

# 受講生のURLを記入
url = "https://furima2020.herokuapp.com/" 

d.get(url)
# d.find_element(:class,"purchase-btn").click
# if /ログイン/ .match(d.page_source)
#   puts "ログインしていない状態で商品出品ページへアクセスすると、ログインページへ遷移しました"
# else
#   puts "☒ログインしていない状態で商品出品ページへアクセスすると、ログインページへ遷移できませんでした"
# end
# d.find_element(:class,"second-logo").click

# if /eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBYlU9IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--d53fdec9442367902a71ec859e7606061e8a3ec4/ .match(d.page_source)
#   puts "ログインしていないユーザーでも、商品の一覧表示を確認でき、出品画像が表示されている" 
# else
#   puts "☒ログインしていないユーザーでも、商品の一覧表示を確認でき、出品画像が表示されていない" 
#   wait
# end

item_name = d.find_element(:class,'item-name')
puts item_name.text

item_price = d.find_element(:class,'item-price')
puts item_price.text






sleep 300