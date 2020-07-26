require 'selenium-webdriver'
wait = Selenium::WebDriver::Wait.new(:timeout => 180000)
d = Selenium::WebDriver.for :chrome

user_nickname = "ナツ"
user_email = "divss@co.jp"
user_password = "aaa111"
user_first_name = "長蛇"
user_last_name = "那津"
user_first_name_kana = "チョウダ"
user_last_name_kana = "ナツ"
user_birth_date_1i = "1991"
user_birth_date_2i = "2"
user_birth_date_3i = "10"

user_nickname2 = "ウサギ"
user_email2 = "dssafdss@co.jp"
user_first_name2 = "宇佐神"
user_last_name2 = "心動"
user_first_name_kana2 = "ウサミ"
user_last_name_kana2 = "シンドウ"
user_birth_date_1i2 = "1910"
user_birth_date_2i2 = "1"
user_birth_date_3i2 = "11"

item_image = "/Users/tech-camp/furima_checkApp/photo/coat.jpg"
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

item_image2 = "/Users/tech-camp/furima_checkApp/photo/sunglass.jpg"
item_name2 = "サングラス"
item_info2 = "限定5品のサングラス"
item_category_id2 = "メンズ"
item_sales_status_id2 ="目立った傷や汚れなし"
item_shipping_fee_status_id2 = "着払い(購入者負担)"
item_prefecture_id2 = "群馬県"
item_scheduled_delivery_id2 = "2~3日で発送"
item_price2 = 30000

number = 4242424242424242
exp_month = 10
exp_year = 30
cvc = 123
postal_code = "965-0873"
prefecture = "福島県"
city = "会津若松市" 
addresses = "追手町１−１"
phone_number = "02089001111"

blank = "---"

#basic認証のidとpass
b_username = "admin"
b_password = "2222"
http ="http://#{b_username}:#{b_password}@"
# 受講生のURLをhttp://以降から記入
url = "#{http}furima-27004.herokuapp.com/"
# url = "https://furima2020.herokuapp.com/"


d.get(url)

d.find_element(:class,"sign-up").click
wait.until {d.find_element(:id, 'user_nickname').displayed?}
d.find_element(:id, 'user_nickname').send_keys(user_nickname)
wait.until {d.find_element(:id, 'user_email').displayed?}
d.find_element(:id, 'user_email').send_keys(user_email)
wait.until {d.find_element(:id, 'user_password').displayed?}
d.find_element(:id, 'user_password').send_keys(user_password)
wait.until {d.find_element(:id, 'user_password_confirmation').displayed?}
d.find_element(:id, 'user_password_confirmation').send_keys(user_password)
wait.until {d.find_element(:id, 'user_first_name').displayed?}
d.find_element(:id, 'user_first_name').send_keys(user_first_name)
wait.until {d.find_element(:id, 'user_last_name ').displayed?}
d.find_element(:id, 'user_last_name ').send_keys(user_last_name )
wait.until {d.find_element(:id, 'user_first_name_kana').displayed?}
d.find_element(:id, 'user_first_name_kana').send_keys(user_first_name_kana)
wait.until {d.find_element(:id, 'user_last_name_kana').displayed?}
d.find_element(:id, 'user_last_name_kana').send_keys(user_last_name_kana)
wait.until {d.find_element(:id, 'user_birth_date_1i').displayed?}
d.find_element(:id, 'user_birth_date_1i').send_keys(user_birth_date_1i)
wait.until {d.find_element(:id, 'user_birth_date_2i').displayed?}
d.find_element(:id, 'user_birth_date_2i').send_keys(user_birth_date_2i)
wait.until {d.find_element(:id, 'user_birth_date_3i').displayed?}
d.find_element(:id, 'user_birth_date_3i').send_keys(user_birth_date_3i)

d.find_element(:class,"register-red-btn").click

# d.find_element(:class,"login").click 
# d.find_element(:id, 'user_email').send_keys(user_email)
# d.find_element(:id, 'user_password').send_keys(user_password)
# d.find_element(:class,"login-red-btn").click


if /FURIMAが選ばれる3つの理由/ .match(d.page_source)
  puts "◯ニックネームが正常に登録されトップページに表示されている。" 
else
  puts "☒ニックネームが正常に登録されずに、トップページに表示されない" 
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end

d.find_element(:class,"logout").click
d.find_element(:class,"login").click 
d.find_element(:id, 'user_email').send_keys(user_email)
d.find_element(:id, 'user_password').send_keys(user_password)
d.find_element(:class,"login-red-btn").click

puts "アカウント1でログイン"

if /FURIMAが選ばれる3つの理由/ .match(d.page_source)
  puts "◯有効な情報でログインを行うと、トップページへ遷移する" 
else
  puts "☒有効な情報でログインを行うがトップページへ遷移しない" 
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end

d.find_element(:class,"purchase-btn").click
wait.until {d.find_element(:id,"item_name").displayed?}
d.find_element(:id,"item_name").send_keys(item_name) 

wait.until {d.find_element(:id,"item_info").displayed?}
d.find_element(:id,"item_info").send_keys(item_info)

wait.until {d.find_element(:id,"item_category_id").displayed?}
d.find_element(:id,"item_category_id").send_keys(item_category_id)

wait.until {d.find_element(:id,"item_sales_status_id").displayed?}
d.find_element(:id,"item_sales_status_id").send_keys(item_sales_status_id)

wait.until {d.find_element(:id,"item_shipping_fee_status_id").displayed?}
d.find_element(:id,"item_shipping_fee_status_id").send_keys(item_shipping_fee_status_id)

wait.until {d.find_element(:id,"item_prefecture_id").displayed?}
d.find_element(:id,"item_prefecture_id").send_keys(item_prefecture_id)

wait.until {d.find_element(:id,"item_scheduled_delivery_id").displayed?}
d.find_element(:id,"item_scheduled_delivery_id").send_keys(item_scheduled_delivery_id)

wait.until {d.find_element(:id,"item_price").displayed?}
d.find_element(:id,"item_price").send_keys(item_price)

d.find_element(:class,"sell-btn").click

if /商品の情報を入力/.match(d.page_source)
  puts "◯画像なしで商品出品を行うと、商品出品ページリダイレクトされる" 
else
  puts "☒画像なしで商品出品を行っても、商品出品ページリダイレクトされない" 
  wait.until {d.find_element(:id,"item_name").displayed?}
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

if /商品の情報を入力/.match(d.page_source)
  puts "◯配送料の負担の記入なしで商品出品を行うと、商品出品ページリダイレクトされる" 
else
  puts "☒配送料の負担の記入なしで商品出品を行っても、商品出品ページリダイレクトされない" 
  wait.until {d.find_element(:id,"item_name").displayed?}
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
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end



if /#{item_image_name}/ .match(d.page_source)
  puts "◯有効な情報を入力すると、レコードが1つ増え、トップページへ遷移し、画像が表示されている。" 
else
  puts "☒有効な情報を入力すると、画像が表示されない" 
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end



if /#{item_price}/.match(d.page_source)
  puts "◯有効な情報を入力すると、レコードが1つ増え、トップページへ遷移し、商品価格が表示されている。" 
else
  puts "☒有効な情報を入力すると、商品価格が表示されない" 
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end

d.find_element(:class,"item-img-content").click 

if /編集/.match(d.page_source)
  puts "◯ログインした上で自分が出品した商品詳細ページへアクセスした場合は、「編集」のリンクが表示される" 
else
  puts "☒ログインした上で自分が出品した商品詳細ページへアクセスした場合は、「編集」のリンクが表示されない" 
  wait.until {d.find_element(:class,"detail-item").displayed?}
end

if /削除/.match(d.page_source)
  puts "◯ログインした上で自分が出品した商品詳細ページへアクセスした場合は、「削除」のリンクが表示される" 
else
  puts "☒ログインした上で自分が出品した商品詳細ページへアクセスした場合は、「削除」のリンクが表示されない" 
  wait.until {d.find_element(:class,"detail-item").displayed?}
end

if /購入画面に進む/.match(d.page_source)
  puts "☒ログインした上で自分が出品した商品詳細ページへアクセスした場合は、「購入」のリンクが表示される" 
else
  puts "◯ログインした上で自分が出品した商品詳細ページへアクセスした場合は、「購入」のリンクが表示されない" 
  wait.until {d.find_element(:class,"detail-item").displayed?}
end

d.find_element(:class,"item-red-btn").click

d.find_element(:id,"item_info").clear
d.find_element(:class,"sell-btn").click
if /商品の情報を入力/.match(d.page_source)
  puts "◯無効な情報で商品編集を行うと、商品出品ページリダイレクトされる" 
else
  puts "☒無効な情報で商品編集を行うと、商品出品ページリダイレクトされない" 
  wait.until {d.find_element(:id,"sell-btn").displayed?}
end

d.find_element(:id,"item_info").send_keys(item_info_re)
d.find_element(:class,"sell-btn").click

if /#{item_info_re}/.match(d.page_source)
  puts "◯有効な情報で商品編集を行うと、レコードが更新され、商品詳細ページへ遷移し、商品出品時に入力した値が表示されている" 
else
  puts "☒有効な情報で商品編集を行うと、レコードが更新され、商品詳細ページへ遷移し、商品出品時に入力した値が表示されない" 
  wait.until {d.find_element(:class,"detail-item").displayed?}
end

d.find_element(:class,"furima-icon").click


d.find_element(:class,"logout").click
d.find_element(:class,"purchase-btn").click
if /ログイン/ .match(d.page_source)
  puts "◯ログインしていない状態で商品出品ページへアクセスすると、ログインページへ遷移しました"
else
  puts "☒ログインしていない状態で商品出品ページへアクセスすると、ログインページへ遷移できませんでした"
end
d.find_element(:class,"second-logo").click

if /#{item_image_name}/ .match(d.page_source)
  puts "◯ログインしていないユーザーでも、商品の一覧表示を確認でき、出品画像が表示されている" 
else
  puts "☒ログインしていないユーザーでも、商品の一覧表示を確認でき、出品画像が表示されていない" 
  wait.until {d.find_element(:class,"detail-item").displayed?}
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
  wait.until {d.find_element(:class,"item-red-btn").displayed?}
end

if /削除/ .match(d.page_source)
  puts "☒ログインしていないユーザーでも、商品の削除が行える" 
else
  puts "◯ログインしていないユーザーは、商品の削除が行えない。" 
  wait.until {d.find_element(:class,"item-red-btn").displayed?}
end

if /購入画面に進む/.match(d.page_source)
  puts "◯ログインした上で自分が出品していない商品詳細ページへアクセスした場合は、「購入」のリンクが表示される" 
else
  puts "☒ログインした上で自分が出品していない商品詳細ページへアクセスした場合に、「購入」のリンクが表示されない" 
  wait.until {d.find_element(:class,"item-red-btn").displayed?}
end

if /編集/ .match(d.page_source)
  puts "☒ログインした上で自分が出品していない商品詳細ページへアクセスした場合に、「編集」のリンクが表示される" 
else
  puts "◯ログインした上で自分が出品していない商品詳細ページへアクセスした場合は、「編集」のリンクが表示されない" 
  wait.until {d.find_element(:class,"item-red-btn").displayed?}
end

if /削除/ .match(d.page_source)
  puts "☒ログインした上で自分が出品していない商品詳細ページへアクセスした場合に、「削除」のリンクが表示される" 
else
  puts "◯ログインした上で自分が出品していない商品詳細ページへアクセスした場合は、「削除」のリンクが表示されない" 
  wait.until {d.find_element(:class,"item-red-btn").displayed?}
end


d.find_element(:class,"item-red-btn").click

if /ログイン/ .match(d.page_source)
  puts "◯ログインしていないユーザーは、商品の購入ボタンを押すと、ログインページへ遷移する" 
else
  puts "☒ログインしていないユーザーは、商品の購入ボタンを押すと、ログインページへ遷移しない" 
  wait.until {d.find_element(:class,"login-red-btn").displayed?}
end

d.find_element(:class,"second-logo").click
d.find_element(:class,"sign-up").click
d.find_element(:id, 'user_nickname').send_keys(user_nickname2)
d.find_element(:id, 'user_email').send_keys(user_email2)
d.find_element(:id, 'user_password').send_keys(user_password)
d.find_element(:id, 'user_password_confirmation').send_keys(user_password)
d.find_element(:id, 'user_first_name').send_keys(user_first_name2)
d.find_element(:id, 'user_last_name ').send_keys(user_last_name2)
d.find_element(:id, 'user_first_name_kana').send_keys(user_first_name_kana2)
d.find_element(:id, 'user_last_name_kana').send_keys(user_last_name_kana2)
d.find_element(:id, 'user_birth_date_1i').send_keys(user_birth_date_1i2)
d.find_element(:id, 'user_birth_date_2i').send_keys(user_birth_date_2i2)
d.find_element(:id, 'user_birth_date_3i').send_keys(user_birth_date_3i2)
d.find_element(:class,"register-red-btn").click

# d.find_element(:class,"login").click
# d.find_element(:id, 'user_email').send_keys(user_email2)
# d.find_element(:id, 'user_password').send_keys(user_password)
# d.find_element(:class,"login-red-btn").click




#クレジットカード情報入力画面に遷移
wait.until {d.find_element(:id, 'number').displayed?}
d.find_element(:id, 'number').send_keys(number)

wait.until {d.find_element(:id, 'exp_month').displayed?}
d.find_element(:id, 'exp_month').send_keys(exp_month)

wait.until {d.find_element(:id, 'exp_year').displayed?}
d.find_element(:id, 'exp_year').send_keys(exp_year)

wait.until {d.find_element(:id, 'cvc').displayed?}
d.find_element(:id, 'cvc').send_keys(cvc)

wait.until {d.find_element(:id, 'postal_code').displayed?}
d.find_element(:id, 'postal_code').send_keys(postal_code)

wait.until {d.find_element(:id, 'prefecture').displayed?}
d.find_element(:id, 'prefecture').send_keys(prefecture)

wait.until {d.find_element(:id, 'city').displayed?}
d.find_element(:id, 'city').send_keys(city)

wait.until {d.find_element(:id, 'addresses').displayed?}
d.find_element(:id, 'addresses').send_keys(addresses)

wait.until {d.find_element(:id, 'phone_number').displayed?}
d.find_element(:id, 'phone_number').send_keys(phone_number)

d.find_element(:class,"buy-red-btn").click
puts "クレジットカード情報登録完了"

wait.until {d.find_element(:class,"furima-icon").displayed?}

if /Sold Out!!/ .match(d.page_source)
  puts "◯売却済みの商品は、「sould out」の文字が表示されるようになっている" 
else
  puts "☒売却済みの商品は、「sould out」の文字が表示されない" 
  wait.until {d.find_element(:class,"sold-out").displayed?}
end

d.find_element(:class,"item-img-content").click 

if /購入画面に進む/ .match(d.page_source)
  puts "☒売却済みの商品だが、購入できるようになっている" 
else
  puts "◯売却済みの商品は、購入できないようになっている" 
  wait.until {d.find_element(:class,"sold-out").displayed?}
end

d.find_element(:class,"furima-icon").click 

d.find_element(:class,"purchase-btn").click
d.find_element(:id,"item_image").send_keys(item_image2)
d.find_element(:id,"item_name").send_keys(item_name2) 
d.find_element(:id,"item_info").send_keys(item_info2)
d.find_element(:id,"item_category_id").send_keys(item_category_id2)
d.find_element(:id,"item_sales_status_id").send_keys(item_sales_status_id2)
d.find_element(:id,"item_shipping_fee_status_id").send_keys(item_shipping_fee_status_id2)
d.find_element(:id,"item_prefecture_id").send_keys(item_prefecture_id2)
d.find_element(:id,"item_scheduled_delivery_id").send_keys(item_scheduled_delivery_id2)
d.find_element(:id,"item_price").send_keys(item_price2)
d.find_element(:class,"sell-btn").click

d.find_element(:class,"item-img-content").click 
d.find_element(:class,"item-destroy").click



if /#{item_name2}/ .match(d.page_source)
  puts "☒ログインした上で自分が出品した商品を削除をすると、商品が削除されない" 
else
  puts "◯ログインした上で自分が出品した商品を削除をすると、商品が削除される" 
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end
puts "LGTM"
sleep 300000000000000