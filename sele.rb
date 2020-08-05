require 'selenium-webdriver'
wait = Selenium::WebDriver::Wait.new(:timeout => 180000)
d = Selenium::WebDriver.for :chrome

nickname = "ナツ"
email = "divss@co.jp"
password = "aaa111"
first_name = "長蛇"
last_name= "那津"
first_name_kana = "チョウダ"
last_name_kana = "ナツ"
user_birth_date_1i = "1991"
user_birth_date_2i = "2"
user_birth_date_3i = "10"

nickname2 = "ウサギ"
email2 = "dssafdss@co.jp"
first_name2 = "宇佐神"
user_last_name2 = "心動"
first_name_kana2 = "ウサミ"
last_name_kana2 = "シンドウ"
user_birth_date_1i2 = "1910"
user_birth_date_2i2 = "1"
user_birth_date_3i2 = "11"

item_image = "/Users/tech-camp/furima_checkApp/photo/coat.jpg"
item_image_name = "coat.jpg"
item_name = "コート"
item_info = "今年イチオシのトレンチコート"
item_info_re = "昨年イチオシのトレンチコート"
item_category = "メンズ"
item_sales_status ="目立った傷や汚れなし"
item_shipping_fee_status = "着払い(購入者負担)"
item_prefecture = "山口県"
item_scheduled_delivery = "2~3日で発送"
item_price = 40000

item_image2 = "/Users/tech-camp/furima_checkApp/photo/sunglass.jpg"
item_name2 = "サングラス"
item_info2 = "限定5品のサングラス"
item_category2 = "メンズ"
item_sales_status2 ="目立った傷や汚れなし"
item_shipping_fee_status2 = "着払い(購入者負担)"
item_prefecture2 = "群馬県"
item_scheduled_delivery2 = "2~3日で発送"
item_price2 = 30000

card_number = 4242424242424242
card_exp_month = 10
card_exp_year = 30
card_cvc = 123
postal_code = "965-0873"
prefecture = "福島県"
city = "会津若松市" 
addresses = "追手町１−１"
phone_number = "02089001111"

blank = "---"

#basic認証のidとpass
b_username = "nickname"
b_password = "anonymous"
http ="http://#{b_username}:#{b_password}@"
# 受講生のURLをhttp://以降から記入
url = "#{http}furima-28318.herokuapp.com/"
# url = "http://localhost:3000/"


d.get(url)

d.find_element(:class,"sign-up").click
wait.until {d.find_element(:id, 'nickname').displayed?}
d.find_element(:id, 'nickname').send_keys(nickname)
wait.until {d.find_element(:id, 'email').displayed?}
d.find_element(:id, 'email').send_keys(email)
wait.until {d.find_element(:id, 'password').displayed?}
d.find_element(:id, 'password').send_keys(password)
wait.until {d.find_element(:id, 'password-confirmation').displayed?}
d.find_element(:id, 'password-confirmation').send_keys(password)
wait.until {d.find_element(:id, 'first-name').displayed?}
d.find_element(:id, 'first-name').send_keys(first_name)
wait.until {d.find_element(:id, 'last-name').displayed?}
d.find_element(:id, 'last-name').send_keys(last_name)
wait.until {d.find_element(:id, 'first-name-kana').displayed?}
d.find_element(:id, 'first-name-kana').send_keys(first_name_kana)
wait.until {d.find_element(:id, 'last-name-kana').displayed?}
d.find_element(:id, 'last-name-kana').send_keys(last_name_kana)



puts "生年月日を入力してください。入力後、登録ボタンを押してください"
wait.until {d.find_element(:class,"purchase-btn").displayed?}



##ログイン
# d.find_element(:class,"login").click 
# d.find_element(:id, 'email').send_keys(email)
# d.find_element(:id, 'password').send_keys(password)
# d.find_element(:class,"login-red-btn").click


if /FURIMAが選ばれる3つの理由/ .match(d.page_source)
  puts "◯ニックネームが正常に登録されトップページに表示されている。" 
else
  puts "☒ニックネームが正常に登録されずに、トップページに表示されない" 
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end

d.find_element(:class,"logout").click
d.find_element(:class,"login").click 
d.find_element(:id, 'email').send_keys(email)
d.find_element(:id, 'password').send_keys(password)
d.find_element(:class,"login-red-btn").click

puts "アカウント1でログイン"

if /FURIMAが選ばれる3つの理由/ .match(d.page_source)
  puts "◯有効な情報でログインを行うと、トップページへ遷移する" 
else
  puts "☒有効な情報でログインを行うがトップページへ遷移しない" 
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end

d.find_element(:class,"purchase-btn").click
wait.until {d.find_element(:id,"item-name").displayed?}
d.find_element(:id,"item-name").send_keys(item_name) 

wait.until {d.find_element(:id,"item-info").displayed?}
d.find_element(:id,"item-info").send_keys(item_info)

wait.until {d.find_element(:id,"item-category").displayed?}
d.find_element(:id,"item-category").send_keys(item_category)

wait.until {d.find_element(:id,"item-sales-status").displayed?}
d.find_element(:id,"item-sales-status").send_keys(item_sales_status)

wait.until {d.find_element(:id,"item-shipping-fee-status").displayed?}
d.find_element(:id,"item-shipping-fee-status").send_keys(item_shipping_fee_status)

wait.until {d.find_element(:id,"item-prefecture").displayed?}
d.find_element(:id,"item-prefecture").send_keys(item_prefecture)

wait.until {d.find_element(:id,"item-scheduled-delivery").displayed?}
d.find_element(:id,"item-scheduled-delivery").send_keys(item_scheduled_delivery)

wait.until {d.find_element(:id,"item-price").displayed?}
d.find_element(:id,"item-price").send_keys(item_price)

d.find_element(:class,"sell-btn").click

if /商品の情報を入力/.match(d.page_source)
  puts "◯画像なしで商品出品を行うと、商品出品ページリダイレクトされる" 
else
  puts "☒画像なしで商品出品を行っても、商品出品ページリダイレクトされない" 
  wait.until {d.find_element(:id,"item-name").displayed?}
end


d.find_element(:id,"item-name").clear 
d.find_element(:id,"item-info").clear
d.find_element(:id,"item-category").send_keys(blank)
d.find_element(:id,"item-sales-status").send_keys(blank)
d.find_element(:id,"item-shipping-fee-status").send_keys(blank)
d.find_element(:id,"item-prefecture").send_keys(blank)
d.find_element(:id,"item-scheduled-delivery").send_keys(blank)
d.find_element(:id,"item-price").clear


d.find_element(:id,"item_image").send_keys(item_image)
d.find_element(:id,"item-name").send_keys(item_name) 
d.find_element(:id,"item-info").send_keys(item_info)
d.find_element(:id,"item-category").send_keys(item_category)
d.find_element(:id,"item-sales-status").send_keys(item_sales_status)

d.find_element(:id,"item-prefecture").send_keys(item_prefecture)
d.find_element(:id,"item-scheduled-delivery").send_keys(item_scheduled_delivery)
d.find_element(:id,"item-price").send_keys(item_price)

d.find_element(:class,"sell-btn").click

if /商品の情報を入力/.match(d.page_source)
  puts "◯配送料の負担の記入なしで商品出品を行うと、商品出品ページリダイレクトされる" 
else
  puts "☒配送料の負担の記入なしで商品出品を行っても、商品出品ページリダイレクトされない" 
  wait.until {d.find_element(:id,"item-name").displayed?}
end


d.find_element(:id,"item_image").clear 
d.find_element(:id,"item-name").clear 
d.find_element(:id,"item-info").clear
d.find_element(:id,"item-category").send_keys(blank)
d.find_element(:id,"item-sales-status").send_keys(blank)
d.find_element(:id,"item-shipping-fee-status").send_keys(blank)
d.find_element(:id,"item-prefecture").send_keys(blank)
d.find_element(:id,"item-scheduled-delivery").send_keys(blank)
d.find_element(:id,"item-price").clear

d.find_element(:id,"item_image").send_keys(item_image)
d.find_element(:id,"item-name").send_keys(item_name) 
d.find_element(:id,"item-info").send_keys(item_info)
d.find_element(:id,"item-category").send_keys(item_category)
d.find_element(:id,"item-sales-status").send_keys(item_sales_status)
d.find_element(:id,"item-shipping-fee-status").send_keys(item_shipping_fee_status)
d.find_element(:id,"item-prefecture").send_keys(item_prefecture)
d.find_element(:id,"item-scheduled-delivery").send_keys(item_scheduled_delivery)
d.find_element(:id,"item-price").send_keys(item_price)

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

d.find_element(:id,"item-info").clear
d.find_element(:class,"sell-btn").click
if /商品の情報を入力/.match(d.page_source)
  puts "◯無効な情報で商品編集を行うと、商品出品ページリダイレクトされる" 
else
  puts "☒無効な情報で商品編集を行うと、商品出品ページリダイレクトされない" 
  wait.until {d.find_element(:id,"sell-btn").displayed?}
end

d.find_element(:id,"item-info").send_keys(item_info_re)
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
d.find_element(:id, 'nickname').send_keys(nickname2)
d.find_element(:id, 'email').send_keys(email2)
d.find_element(:id, 'password').send_keys(password)
d.find_element(:id, 'password-confirmation').send_keys(password)
d.find_element(:id, 'first-name').send_keys(first_name2)
d.find_element(:id, 'last-name').send_keys(user_last_name2)
d.find_element(:id, 'first-name-kana').send_keys(first_name_kana2)
d.find_element(:id, 'last-name-kana').send_keys(last_name_kana2)

puts "生年月日を入力してください後、登録ボタンを押してください"
wait.until {d.find_element(:class,"purchase-btn").displayed?}

##ログイン
# d.find_element(:class,"login").click
# d.find_element(:id, 'email').send_keys(email2)
# d.find_element(:id, 'password').send_keys(password)
# d.find_element(:class,"login-red-btn").click




#クレジットカード情報入力画面に遷移
wait.until {d.find_element(:id, 'card-number').displayed?}
d.find_element(:id, 'card-number').send_keys(card_number)

wait.until {d.find_element(:id, 'card-exp-month').displayed?}
d.find_element(:id, 'card-exp-month').send_keys(card_exp_month)

wait.until {d.find_element(:id, 'card-exp-year').displayed?}
d.find_element(:id, 'card-exp-year').send_keys(card_exp_year)

wait.until {d.find_element(:id, 'card-cvc').displayed?}
d.find_element(:id, 'card-cvc').send_keys(card_cvc)

wait.until {d.find_element(:id, 'postal-code').displayed?}
d.find_element(:id, 'postal-code').send_keys(postal_code)

wait.until {d.find_element(:id, 'prefecture').displayed?}
d.find_element(:id, 'prefecture').send_keys(prefecture)

wait.until {d.find_element(:id, 'city').displayed?}
d.find_element(:id, 'city').send_keys(city)

wait.until {d.find_element(:id, 'addresses').displayed?}
d.find_element(:id, 'addresses').send_keys(addresses)

wait.until {d.find_element(:id, 'phone-number').displayed?}
d.find_element(:id, 'phone-number').send_keys(phone_number)

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
d.find_element(:id,"item-name").send_keys(item_name2) 
d.find_element(:id,"item-info").send_keys(item_info2)
d.find_element(:id,"item-category").send_keys(item_category2)
d.find_element(:id,"item-sales-status").send_keys(item_sales_status2)
d.find_element(:id,"item-shipping-fee-status").send_keys(item_shipping_fee_status2)
d.find_element(:id,"item-prefecture").send_keys(item_prefecture2)
d.find_element(:id,"item-scheduled-delivery").send_keys(item_scheduled_delivery2)
d.find_element(:id,"item-price").send_keys(item_price2)
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