require 'selenium-webdriver'
wait = Selenium::WebDriver::Wait.new(:timeout => 180000)
d = Selenium::WebDriver.for :chrome

user_nickname = "社会人デビュ"
user_email = "divde2@co.jp"
user_password = "aaa111"
user_first_name = "社会回"
user_last_name = "出対回"
user_first_name_kana = "シャカ"
user_last_name_kana = "デタ"
user_birth_date_1i = "1998"
user_birth_date_2i = "9"
user_birth_date_3i = "30"

# 受講生のURLを記入
url = "https://furima2020.herokuapp.com/" 

 d.get(url)
d.find_element(:class,"purchase-btn").click
if /ログイン/ .match(d.page_source)
  puts "◯ログインしていない状態で商品出品ページへアクセスすると、ログインページへ遷移しました"
else
  puts "☒ログインしていない状態で商品出品ページへアクセスすると、ログインページへ遷移できませんでした"
end
d.find_element(:class,"second-logo").click

if /eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBYlU9IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--d53fdec9442367902a71ec859e7606061e8a3ec4/ .match(d.page_source)
  puts "◯ログインしていないユーザーでも、商品の一覧表示を確認でき、出品画像が表示されている" 
else
  puts "☒ログインしていないユーザーでも、商品の一覧表示を確認でき、出品画像が表示されていない" 
  wait
end

item_name = d.find_element(:class,'item-name')
puts "◯商品名は" +item_name.text

item_price = d.find_element(:class,'item-price')
puts "◯商品価格は" + item_price.text

d.find_element(:class,"item-img-content").click
if /編集/ .match(d.page_source)
  puts "☒ログインしていないユーザーでも、商品の編集が行える" 
else
  puts "◯ログインしていないユーザーは、商品の編集が行えない。" 
  wait
end

if /削除/ .match(d.page_source)
  puts "☒ログインしていないユーザーでも、商品の削除が行える" 
else
  puts "◯ログインしていないユーザーは、商品の削除が行えない。" 
  wait
end


d.find_element(:class,"item-red-btn").click

if /ログイン/ .match(d.page_source)
  puts "◯ログインしていないユーザーは、商品の購入ボタンを押すと、ログインページへ遷移する" 
else
  puts "☒ログインしていないユーザーは、商品の購入ボタンを押すと、ログインページへ遷移しない" 
  wait
end

d.find_element(:class,"purchase-btn").click

d.find_element(:class,"sign-up").click

d.find_element(:id, 'user_nickname').send_keys(user_nickname)
d.find_element(:id, 'user_email').send_keys(user_email)
d.find_element(:id, 'user_password').send_keys(user_password)
d.find_element(:id, 'user_password_confirmation').send_keys(user_password)
d.find_element(:id, 'user_first_name').send_keys(user_first_name)
d.find_element(:id, 'user_last_name ').send_keys(user_last_name )
d.find_element(:id, 'user_first_name_kana').send_keys(user_first_name_kana)
d.find_element(:id, 'user_last_name_kana').send_keys(user_last_name_kana)
d.find_element(:id, 'user_birth_date_1i').send_keys(user_birth_date_1i)
d.find_element(:id, 'user_birth_date_2i').send_keys(user_birth_date_2i)
d.find_element(:id, 'user_birth_date_3i').send_keys(user_birth_date_3i)

d.find_element(:class,"register-red-btn").click


if /FURIMAが選ばれる3つの理由/ .match(d.page_source)
  puts "◯ニックネームが正常に登録されトップページに表示されている。" 
else
  puts "☒ニックネームが正常に登録されずに、トップページに表示されない" 
  wait
end




sleep 300000000000000