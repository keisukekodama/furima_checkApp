require 'selenium-webdriver'
wait = Selenium::WebDriver::Wait.new(:timeout => 180000)
d = Selenium::WebDriver.for :chrome

user_nickname = "社会人あビュ"
user_email = "divdes2d@co.jp"
user_password = "aaa111"
user_first_name = "社回あ"
user_last_name = "出回あ"
user_first_name_kana = "シャカタ"
user_last_name_kana = "デタアカウント"
user_birth_date_1i = "1998"
user_birth_date_2i = "9"
user_birth_date_3i = "30"

item_image = "/Users/tech-camp/Desktop/coat.jpg"
item_image_name = "coat.jpg"
item_name = "コート"
item_info = "今年イチオシのトレンチコート"
item_info_re = "昨年イチオシのトレンチコート"
item_category_id = "メンズ"
item_sales_status_id ="目立った傷や汚れなし"
item_shipping_fee_status_id = "着払い(購入者負担)"
item_prefecture_id = "山口県"
item_scheduled_delivery_id = "2~3日で発送"
item_price = 40000

blank = "---"
# 受講生のURLを記入
url = "https://furima2020.herokuapp.com/" 

d.get(url)

# d.find_element(:class,"sign-up").click

# d.find_element(:id, 'user_nickname').send_keys(user_nickname)
# d.find_element(:id, 'user_email').send_keys(user_email)
# d.find_element(:id, 'user_password').send_keys(user_password)
# d.find_element(:id, 'user_password_confirmation').send_keys(user_password)
# d.find_element(:id, 'user_first_name').send_keys(user_first_name)
# d.find_element(:id, 'user_last_name ').send_keys(user_last_name )
# d.find_element(:id, 'user_first_name_kana').send_keys(user_first_name_kana)
# d.find_element(:id, 'user_last_name_kana').send_keys(user_last_name_kana)
# d.find_element(:id, 'user_birth_date_1i').send_keys(user_birth_date_1i)
# d.find_element(:id, 'user_birth_date_2i').send_keys(user_birth_date_2i)
# d.find_element(:id, 'user_birth_date_3i').send_keys(user_birth_date_3i)

# d.find_element(:class,"register-red-btn").click


# if /FURIMAが選ばれる3つの理由/ .match(d.page_source)
#   puts "◯ニックネームが正常に登録されトップページに表示されている。" 
# else
#   puts "☒ニックネームが正常に登録されずに、トップページに表示されない" 
#   wait
# end

# d.find_element(:class,"logout").click
d.find_element(:class,"login").click 
d.find_element(:id, 'user_email').send_keys(user_email)
d.find_element(:id, 'user_password').send_keys(user_password)
d.find_element(:class,"login-red-btn").click

if /FURIMAが選ばれる3つの理由/ .match(d.page_source)
  puts "◯有効な情報でログインを行うと、トップページへ遷移する" 
else
  puts "☒有効な情報でログインを行うがトップページへ遷移しない" 
  wait
end

d.find_element(:class,"purchase-btn").click

d.find_element(:id,"item_name").send_keys(item_name) 
d.find_element(:id,"item_info").send_keys(item_info)
d.find_element(:id,"item_category_id").send_keys(item_category_id)
d.find_element(:id,"item_sales_status_id").send_keys(item_sales_status_id)
d.find_element(:id,"item_shipping_fee_status_id").send_keys(item_shipping_fee_status_id)
d.find_element(:id,"item_prefecture_id").send_keys(item_prefecture_id)
d.find_element(:id,"item_scheduled_delivery_id").send_keys(item_scheduled_delivery_id)
d.find_element(:id,"item_price").send_keys(item_price)

d.find_element(:class,"sell-btn").click

if /Image can't be blank/.match(d.page_source)
  puts "◯画像なしで商品出品を行うと、商品出品ページにて、エラーメッセージ が表示される" 
else
  puts "☒画像なしで商品出品を行っても、商品出品ページにて、エラーメッセージ が表示されない" 
  wait
end


d.find_element(:id,"item_name").clear 
d.find_element(:id,"item_info").clear
d.find_element(:id,"item_category_id").send_keys(blank)
d.find_element(:id,"item_sales_status_id").send_keys(blank)
d.find_element(:id,"item_shipping_fee_status_id").send_keys(blank)
d.find_element(:id,"item_prefecture_id").send_keys(blank)
d.find_element(:id,"item_scheduled_delivery_id").send_keys(blank)
d.find_element(:id,"item_price").clear


d.find_element(:id,"item_image").send_keys(item_image)
d.find_element(:id,"item_name").send_keys(item_name) 
d.find_element(:id,"item_info").send_keys(item_info)
d.find_element(:id,"item_category_id").send_keys(item_category_id)
d.find_element(:id,"item_sales_status_id").send_keys(item_sales_status_id)

d.find_element(:id,"item_prefecture_id").send_keys(item_prefecture_id)
d.find_element(:id,"item_scheduled_delivery_id").send_keys(item_scheduled_delivery_id)
d.find_element(:id,"item_price").send_keys(item_price)

d.find_element(:class,"sell-btn").click

if /Shipping fee status Select/.match(d.page_source)
  puts "◯配送料の負担の記入なしで商品出品を行うと、商品出品ページにて、エラーメッセージが表示される" 
else
  puts "☒配送料の負担の記入なしで商品出品を行っても、商品出品ページにて、エラーメッセージが表示されない" 
  wait
end


d.find_element(:id,"item_image").clear 
d.find_element(:id,"item_name").clear 
d.find_element(:id,"item_info").clear
d.find_element(:id,"item_category_id").send_keys(blank)
d.find_element(:id,"item_sales_status_id").send_keys(blank)
d.find_element(:id,"item_shipping_fee_status_id").send_keys(blank)
d.find_element(:id,"item_prefecture_id").send_keys(blank)
d.find_element(:id,"item_scheduled_delivery_id").send_keys(blank)
d.find_element(:id,"item_price").clear

d.find_element(:id,"item_image").send_keys(item_image)
d.find_element(:id,"item_name").send_keys(item_name) 
d.find_element(:id,"item_info").send_keys(item_info)
d.find_element(:id,"item_category_id").send_keys(item_category_id)
d.find_element(:id,"item_sales_status_id").send_keys(item_sales_status_id)
d.find_element(:id,"item_shipping_fee_status_id").send_keys(item_shipping_fee_status_id)
d.find_element(:id,"item_prefecture_id").send_keys(item_prefecture_id)
d.find_element(:id,"item_scheduled_delivery_id").send_keys(item_scheduled_delivery_id)
d.find_element(:id,"item_price").send_keys(item_price)

d.find_element(:class,"sell-btn").click


if /#{item_name}/ .match(d.page_source)
  puts "◯有効な情報を入力すると、レコードが1つ増え、トップページへ遷移し、商品名が表示されている。" 
else
  puts "☒有効な情報を入力すると、商品名が表示されない。" 
  wait
end



if /#{item_image_name}/ .match(d.page_source)
  puts "◯有効な情報を入力すると、レコードが1つ増え、トップページへ遷移し、画像が表示されている。" 
else
  puts "☒有効な情報を入力すると、画像が表示されない" 
  wait
end



if /#{item_price}/.match(d.page_source)
  puts "◯有効な情報を入力すると、レコードが1つ増え、トップページへ遷移し、商品価格が表示されている。" 
else
  puts "☒有効な情報を入力すると、商品価格が表示されない" 
  wait
end

d.find_element(:class,"item-img-content").click 

if /編集/.match(d.page_source)
  puts "◯ログインした上で自分が出品した商品詳細ページへアクセスした場合は、「編集」のリンクが表示される" 
else
  puts "☒ログインした上で自分が出品した商品詳細ページへアクセスした場合は、「編集」のリンクが表示されない" 
  wait
end

if /削除/.match(d.page_source)
  puts "◯ログインした上で自分が出品した商品詳細ページへアクセスした場合は、「削除」のリンクが表示される" 
else
  puts "☒ログインした上で自分が出品した商品詳細ページへアクセスした場合は、「削除」のリンクが表示されない" 
  wait
end

if /購入画面に進む/.match(d.page_source)
  puts "☒ログインした上で自分が出品した商品詳細ページへアクセスした場合は、「購入」のリンクが表示される" 
else
  puts "◯ログインした上で自分が出品した商品詳細ページへアクセスした場合は、「購入」のリンクが表示されない" 
  wait
end

d.find_element(:class,"item-red-btn").click

d.find_element(:id,"item_info").clear
d.find_element(:class,"sell-btn").click
if /Info can't be blank/.match(d.page_source)
  puts "◯無効な情報で商品編集を行うと、商品編集ページにて、エラーメッセージ が表示される。" 
else
  puts "☒無効な情報で商品編集を行うと、商品編集ページにて、エラーメッセージ が表示されない" 
  wait
end

d.find_element(:id,"item_info").send_keys(item_info_re)
d.find_element(:class,"sell-btn").click

if /#{item_info_re}/.match(d.page_source)
  puts "◯有効な情報で商品編集を行うと、レコードが更新され、商品詳細ページへ遷移し、商品出品時に入力した値が表示されている" 
else
  puts "☒有効な情報で商品編集を行うと、レコードが更新され、商品詳細ページへ遷移し、商品出品時に入力した値が表示されない" 
  wait
end

d.find_element(:class,"furima-icon").click

sleep 300000000000000
# d.find_element(:class,"logout").click
# d.find_element(:class,"purchase-btn").click
# if /ログイン/ .match(d.page_source)
#   puts "◯ログインしていない状態で商品出品ページへアクセスすると、ログインページへ遷移しました"
# else
#   puts "☒ログインしていない状態で商品出品ページへアクセスすると、ログインページへ遷移できませんでした"
# end
# d.find_element(:class,"second-logo").click

# if /#{item_image_name}/ .match(d.page_source)
#   puts "◯ログインしていないユーザーでも、商品の一覧表示を確認でき、出品画像が表示されている" 
# else
#   puts "☒ログインしていないユーザーでも、商品の一覧表示を確認でき、出品画像が表示されていない" 
#   wait
# end

# item_name = d.find_element(:class,'item-name')
# puts "◯商品名は" +item_name.text

# item_price = d.find_element(:class,'item-price')
# puts "◯商品価格は" + item_price.text

# d.find_element(:class,"item-img-content").click
# if /編集/ .match(d.page_source)
#   puts "☒ログインしていないユーザーでも、商品の編集が行える" 
# else
#   puts "◯ログインしていないユーザーは、商品の編集が行えない。" 
#   wait
# end

# if /削除/ .match(d.page_source)
#   puts "☒ログインしていないユーザーでも、商品の削除が行える" 
# else
#   puts "◯ログインしていないユーザーは、商品の削除が行えない。" 
#   wait
# end


# d.find_element(:class,"item-red-btn").click

# if /ログイン/ .match(d.page_source)
#   puts "◯ログインしていないユーザーは、商品の購入ボタンを押すと、ログインページへ遷移する" 
# else
#   puts "☒ログインしていないユーザーは、商品の購入ボタンを押すと、ログインページへ遷移しない" 
#   wait
# end

