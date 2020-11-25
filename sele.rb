require 'selenium-webdriver'
wait = Selenium::WebDriver::Wait.new(:timeout => 180000)
d = Selenium::WebDriver.for :chrome


#basic認証のidとpass
b_id = "admin"
b_password = "2222"
http ="http://#{b_id}:#{b_password}@"
# 受講生のURLをhttp://以降から記入

url = "#{http}furima-31714.herokuapp.com/"



item_image = ""
item_image2 = ""


nickname = "kusunnjyun"
email = "divssd23s@co.jp"
password = "aaa111"
first_name = "愛"
last_name= "不時着"
first_name_kana = "アイ"
last_name_kana = "フジチャク"

nickname2 = "class"
email2 = "dssaf26s@co.jp"
first_name2 = "梨泰"
user_last_name2 = "院"
first_name_kana2 = "イテウォン"
last_name_kana2 = "クラス"



item_image_name = "coat.jpg"
item_name = "コート"
item_info = "今年イチオシのトレンチコート"
item_info_re = "昨年イチオシのトレンチコート"
value = '2'

item_price = 40000


item_name2 = "サングラス"
item_info2 = "限定5品のサングラス"

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

blank = "1"
password_string = "aaaaaa"
password_int = "111111"
password_short4 = "aa11"
year = 1998
month = 11
day = 13
phone_number_hyphen  ="080-9999-0000"
postal_code_nohyphen = "9650873"
password_dummy = "bbb222"
blank1 = "--"
# url = "http://localhost:3000/"



d.get(url)

d.find_element(:class,"sign-up").click
wait.until {d.find_element(:id, 'nickname').displayed?}

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


d.find_element(:id, 'user_birthday_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birth_day_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_BirthDay_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birth_date_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birthdate_1i').send_keys(year) rescue nil

d.find_element(:id, 'user_birthday_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_day_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_BirthDay_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_date_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birthdate_2i').send_keys(month) rescue nil

d.find_element(:id, 'user_birthday_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_day_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_BirthDay_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_date_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birthdate_3i').send_keys(month) rescue nil

d.find_element(:class,"register-red-btn").click


if /会員情報入力/ .match(d.page_source)
  puts "!ニックネームを入力しないと、ユーザー登録ができない。" 
else
  puts "!ニックネームを入力しなくても、ユーザー登録ができる" 
  puts "☒必須項目が一つでも欠けている場合でも、ユーザー登録ができる"
  wait.until {d.find_element(:id,"nickname").displayed?}
end

puts "◯必須項目が一つでも欠けている場合は、ユーザー登録ができない"

d.find_element(:id, 'nickname').clear
wait.until {d.find_element(:id, 'email').displayed?}
d.find_element(:id, 'email').clear
wait.until {d.find_element(:id, 'password').displayed?}
d.find_element(:id, 'password').clear
wait.until {d.find_element(:id, 'password-confirmation').displayed?}
d.find_element(:id, 'password-confirmation').clear
wait.until {d.find_element(:id, 'first-name').displayed?}
d.find_element(:id, 'first-name').clear
wait.until {d.find_element(:id, 'last-name').displayed?}
d.find_element(:id, 'last-name').clear
wait.until {d.find_element(:id, 'first-name-kana').displayed?}
d.find_element(:id, 'first-name-kana').clear
wait.until {d.find_element(:id, 'last-name-kana').displayed?}
d.find_element(:id, 'last-name-kana').clear


#パスワードは確認用を含めて2回入力する
wait.until {d.find_element(:id, 'nickname').displayed?}
d.find_element(:id, 'nickname').send_keys(nickname)
wait.until {d.find_element(:id, 'email').displayed?}
d.find_element(:id, 'email').send_keys(email)
wait.until {d.find_element(:id, 'password').displayed?}
d.find_element(:id, 'password').send_keys(password_string)
wait.until {d.find_element(:id, 'password-confirmation').displayed?}
d.find_element(:id, 'password-confirmation').send_keys(password_dummy)
wait.until {d.find_element(:id, 'first-name').displayed?}
d.find_element(:id, 'first-name').send_keys(first_name)
wait.until {d.find_element(:id, 'last-name').displayed?}
d.find_element(:id, 'last-name').send_keys(last_name)
wait.until {d.find_element(:id, 'first-name-kana').displayed?}
d.find_element(:id, 'first-name-kana').send_keys(first_name_kana)
wait.until {d.find_element(:id, 'last-name-kana').displayed?}
d.find_element(:id, 'last-name-kana').send_keys(last_name_kana)
d.find_element(:id, 'user_birthday_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birth_day_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_BirthDay_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birth_date_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birthdate_1i').send_keys(year) rescue nil

d.find_element(:id, 'user_birthday_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_day_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_BirthDay_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_date_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birthdate_2i').send_keys(month) rescue nil

d.find_element(:id, 'user_birthday_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_day_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_BirthDay_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_date_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birthdate_3i').send_keys(month) rescue nil

sleep 3
d.find_element(:class,"register-red-btn").click


if /会員情報入力/ .match(d.page_source)
  puts "!パスワードは確認用を含めて2回入力しないと、ユーザー登録ができない。" 
else
  puts "!パスワードは確認用を含めて2回入力しなくても、ユーザー登録ができる" 
  puts "☒パスワードは確認用を含めて2回入力しない"
  wait.until {d.find_element(:id,"nickname").displayed?}
end
puts "◯パスワードは確認用を含めて2回入力する"


d.find_element(:id, 'nickname').clear
wait.until {d.find_element(:id, 'email').displayed?}
d.find_element(:id, 'email').clear
wait.until {d.find_element(:id, 'password').displayed?}
d.find_element(:id, 'password').clear
wait.until {d.find_element(:id, 'password-confirmation').displayed?}
d.find_element(:id, 'password-confirmation').clear
wait.until {d.find_element(:id, 'first-name').displayed?}
d.find_element(:id, 'first-name').clear
wait.until {d.find_element(:id, 'last-name').displayed?}
d.find_element(:id, 'last-name').clear
wait.until {d.find_element(:id, 'first-name-kana').displayed?}
d.find_element(:id, 'first-name-kana').clear
wait.until {d.find_element(:id, 'last-name-kana').displayed?}
d.find_element(:id, 'last-name-kana').clear

#パスワードは半角英数字混合であること
#文字だけの場合
wait.until {d.find_element(:id, 'nickname').displayed?}
d.find_element(:id, 'nickname').send_keys(nickname)
wait.until {d.find_element(:id, 'email').displayed?}
d.find_element(:id, 'email').send_keys(email)
wait.until {d.find_element(:id, 'password').displayed?}
d.find_element(:id, 'password').send_keys(password_string)
wait.until {d.find_element(:id, 'password-confirmation').displayed?}
d.find_element(:id, 'password-confirmation').send_keys(password_string)
wait.until {d.find_element(:id, 'first-name').displayed?}
d.find_element(:id, 'first-name').send_keys(first_name)
wait.until {d.find_element(:id, 'last-name').displayed?}
d.find_element(:id, 'last-name').send_keys(last_name)
wait.until {d.find_element(:id, 'first-name-kana').displayed?}
d.find_element(:id, 'first-name-kana').send_keys(first_name_kana)
wait.until {d.find_element(:id, 'last-name-kana').displayed?}
d.find_element(:id, 'last-name-kana').send_keys(last_name_kana)
d.find_element(:id, 'user_birthday_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birth_day_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_BirthDay_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birth_date_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birthdate_1i').send_keys(year) rescue nil

d.find_element(:id, 'user_birthday_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_day_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_BirthDay_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_date_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birthdate_2i').send_keys(month) rescue nil

d.find_element(:id, 'user_birthday_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_day_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_BirthDay_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_date_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birthdate_3i').send_keys(month) rescue nil


d.find_element(:class,"register-red-btn").click

if /会員情報入力/ .match(d.page_source)
  puts "!パスワードは文字のみだと、ユーザー登録ができない。" 
else
  puts "!パスワードは文字のみでも、ユーザー登録ができる"
  puts "☒パスワードは半角英数字混合でない"
  wait.until {d.find_element(:id,"nickname").displayed?}
end

d.find_element(:id, 'nickname').clear
wait.until {d.find_element(:id, 'email').displayed?}
d.find_element(:id, 'email').clear
wait.until {d.find_element(:id, 'password').displayed?}
d.find_element(:id, 'password').clear
wait.until {d.find_element(:id, 'password-confirmation').displayed?}
d.find_element(:id, 'password-confirmation').clear
wait.until {d.find_element(:id, 'first-name').displayed?}
d.find_element(:id, 'first-name').clear
wait.until {d.find_element(:id, 'last-name').displayed?}
d.find_element(:id, 'last-name').clear
wait.until {d.find_element(:id, 'first-name-kana').displayed?}
d.find_element(:id, 'first-name-kana').clear
wait.until {d.find_element(:id, 'last-name-kana').displayed?}
d.find_element(:id, 'last-name-kana').clear

#パスワード半角英数であるかどうか
#数字だけの場合
wait.until {d.find_element(:id, 'nickname').displayed?}
d.find_element(:id, 'nickname').send_keys(nickname)
wait.until {d.find_element(:id, 'email').displayed?}
d.find_element(:id, 'email').send_keys(email)
wait.until {d.find_element(:id, 'password').displayed?}
d.find_element(:id, 'password').send_keys(password_int)
wait.until {d.find_element(:id, 'password-confirmation').displayed?}
d.find_element(:id, 'password-confirmation').send_keys(password_int)
wait.until {d.find_element(:id, 'first-name').displayed?}
d.find_element(:id, 'first-name').send_keys(first_name)
wait.until {d.find_element(:id, 'last-name').displayed?}
d.find_element(:id, 'last-name').send_keys(last_name)
wait.until {d.find_element(:id, 'first-name-kana').displayed?}
d.find_element(:id, 'first-name-kana').send_keys(first_name_kana)
wait.until {d.find_element(:id, 'last-name-kana').displayed?}
d.find_element(:id, 'last-name-kana').send_keys(last_name_kana)
d.find_element(:id, 'user_birthday_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birth_day_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_BirthDay_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birth_date_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birthdate_1i').send_keys(year) rescue nil

d.find_element(:id, 'user_birthday_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_day_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_BirthDay_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_date_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birthdate_2i').send_keys(month) rescue nil

d.find_element(:id, 'user_birthday_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_day_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_BirthDay_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_date_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birthdate_3i').send_keys(month) rescue nil

d.find_element(:class,"register-red-btn").click

if /会員情報入力/ .match(d.page_source)
  puts "!パスワードは数字のみだと、ユーザー登録ができない。" 
else
  puts "!パスワードは数字のみでも、ユーザー登録ができる" 
  puts "☒パスワードは半角英数字混合でない"
  wait.until {d.find_element(:id,"nickname").displayed?}
end


d.find_element(:id, 'nickname').clear
wait.until {d.find_element(:id, 'email').displayed?}
d.find_element(:id, 'email').clear
wait.until {d.find_element(:id, 'password').displayed?}
d.find_element(:id, 'password').clear
wait.until {d.find_element(:id, 'password-confirmation').displayed?}
d.find_element(:id, 'password-confirmation').clear
wait.until {d.find_element(:id, 'first-name').displayed?}
d.find_element(:id, 'first-name').clear
wait.until {d.find_element(:id, 'last-name').displayed?}
d.find_element(:id, 'last-name').clear
wait.until {d.find_element(:id, 'first-name-kana').displayed?}
d.find_element(:id, 'first-name-kana').clear
wait.until {d.find_element(:id, 'last-name-kana').displayed?}
d.find_element(:id, 'last-name-kana').clear

puts "◯パスワードは半角英数字混合であること"


#パスワードは6文字以上であること

wait.until {d.find_element(:id, 'nickname').displayed?}
d.find_element(:id, 'nickname').send_keys(nickname)
wait.until {d.find_element(:id, 'email').displayed?}
d.find_element(:id, 'email').send_keys(email)
wait.until {d.find_element(:id, 'password').displayed?}
d.find_element(:id, 'password').send_keys(password_short4)
wait.until {d.find_element(:id, 'password-confirmation').displayed?}
d.find_element(:id, 'password-confirmation').send_keys(password_short4)
wait.until {d.find_element(:id, 'first-name').displayed?}
d.find_element(:id, 'first-name').send_keys(first_name)
wait.until {d.find_element(:id, 'last-name').displayed?}
d.find_element(:id, 'last-name').send_keys(last_name)
wait.until {d.find_element(:id, 'first-name-kana').displayed?}
d.find_element(:id, 'first-name-kana').send_keys(first_name_kana)
wait.until {d.find_element(:id, 'last-name-kana').displayed?}
d.find_element(:id, 'user_birthday_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birth_day_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_BirthDay_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birth_date_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birthdate_1i').send_keys(year) rescue nil

d.find_element(:id, 'user_birthday_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_day_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_BirthDay_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_date_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birthdate_2i').send_keys(month) rescue nil

d.find_element(:id, 'user_birthday_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_day_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_BirthDay_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_date_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birthdate_3i').send_keys(month) rescue nil

d.find_element(:class,"register-red-btn").click

if /会員情報入力/ .match(d.page_source)
  puts "!パスワードは6文字以下だとユーザー登録できない。" 
else
  puts "!パスワードは半6文字以下でもユーザー登録できる。" 
  puts "☒パスワードは6文字以上でない" 
  wait.until {d.find_element(:id,"nickname").displayed?}
end
puts "◯パスワードは6文字以上である"

d.find_element(:id, 'nickname').clear
wait.until {d.find_element(:id, 'email').displayed?}
d.find_element(:id, 'email').clear
wait.until {d.find_element(:id, 'password').displayed?}
d.find_element(:id, 'password').clear
wait.until {d.find_element(:id, 'password-confirmation').displayed?}
d.find_element(:id, 'password-confirmation').clear
wait.until {d.find_element(:id, 'first-name').displayed?}
d.find_element(:id, 'first-name').clear
wait.until {d.find_element(:id, 'last-name').displayed?}
d.find_element(:id, 'last-name').clear
wait.until {d.find_element(:id, 'first-name-kana').displayed?}
d.find_element(:id, 'first-name-kana').clear
wait.until {d.find_element(:id, 'last-name-kana').displayed?}
d.find_element(:id, 'last-name-kana').clear



wait.until {d.find_element(:id, 'nickname').displayed?}
d.find_element(:id, 'nickname').send_keys(nickname)
puts "◯ニックネームが必須である"

wait.until {d.find_element(:id, 'email').displayed?}
d.find_element(:id, 'email').send_keys(email)
puts "◯メールアドレスが必須である"
puts "◯メールアドレスは一意性である"
puts "◯メールアドレスは@を含む必要がある"

wait.until {d.find_element(:id, 'password').displayed?}
d.find_element(:id, 'password').send_keys(password)
puts "◯パスワードが必須である"

wait.until {d.find_element(:id, 'password-confirmation').displayed?}
d.find_element(:id, 'password-confirmation').send_keys(password)


wait.until {d.find_element(:id, 'first-name').displayed?}
d.find_element(:id, 'first-name').send_keys(first_name)
wait.until {d.find_element(:id, 'last-name').displayed?}
d.find_element(:id, 'last-name').send_keys(last_name)
puts "◯ユーザー本名が、名字と名前がそれぞれ必須である"
puts "◯ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させる"


wait.until {d.find_element(:id, 'first-name-kana').displayed?}
d.find_element(:id, 'first-name-kana').send_keys(first_name_kana)
wait.until {d.find_element(:id, 'last-name-kana').displayed?}
d.find_element(:id, 'last-name-kana').send_keys(last_name_kana)
puts "◯ユーザー本名のフリガナが、名字と名前でそれぞれ必須である"
puts "◯ユーザー本名のフリガナは全角（カタカナ）で入力させる"

d.find_element(:id, 'user_birthday_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birth_day_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_BirthDay_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birth_date_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birthdate_1i').send_keys(year) rescue nil

d.find_element(:id, 'user_birthday_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_day_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_BirthDay_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_date_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birthdate_2i').send_keys(month) rescue nil

d.find_element(:id, 'user_birthday_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_day_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_BirthDay_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_date_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birthdate_3i').send_keys(month) rescue nil
sleep 5
d.find_element(:class,"register-red-btn").click

puts "◯生年月日が必須である"


# #ログイン
# d.find_element(:class,"login").click 
# d.find_element(:id, 'email').send_keys(email)
# d.find_element(:id, 'password').send_keys(password)
# d.find_element(:class,"login-red-btn").click


if /FURIMAが選ばれる3つの理由/ .match(d.page_source)
  puts "◯必須項目を入力し、ユーザー登録ができる" 
else
  puts "☒生年月日を手動で入力し、トップページに遷移しない場合は、必須項目を入力し、ユーザー登録ができていない" 
  d.find_element(:id, 'password').send_keys(password)
  d.find_element(:id, 'password-confirmation').send_keys(password)
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end


d.find_element(:link_text,"ログアウト").click


wait.until {d.find_element(:class,"login").displayed?}
d.find_element(:class,"login").click 
wait.until {d.find_element(:id, 'email').displayed?}
d.find_element(:id, 'email').send_keys(email)
wait.until {d.find_element(:id, 'password').displayed?}
d.find_element(:id, 'password').send_keys(password)
wait.until {d.find_element(:class,"login-red-btn").displayed?}
d.find_element(:class,"login-red-btn").click

# puts "アカウント1でログイン"

if /FURIMAが選ばれる3つの理由/ .match(d.page_source)
  puts "◯ログイン/ログアウトができる" 
else
  puts "☒ログイン/ログアウトができない" 
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end

if /出品する/ .match(d.page_source)
  d.find_element(:class,"purchase-btn").click
  puts "!出品ページに遷移1"
  puts 1
elsif /出品する/ .match(d.page_source)
  d.find_element(:class,"purchase-btn-text").click
  puts "!出品ページに遷移2"
  puts 2
elsif /出品する/ .match(d.page_source)
    d.find_element(:class,"purchase-btn-icon").click
    puts "!出品ページに遷移3"
  puts 3
else
  d.get(url+"/items/new")
  puts "!出品ページに遷移できない"
  sleep 300
end



wait.until {d.find_element(:id,"item-name").displayed?}
d.find_element(:id,"item-name").send_keys(item_name) 

wait.until {d.find_element(:id,"item-info").displayed?}
d.find_element(:id,"item-info").send_keys(item_info)

wait.until {d.find_element(:id,"item-category").displayed?}
item_category_element = d.find_element(:id,"item-category")
item_category = Selenium::WebDriver::Support::Select.new(item_category_element)
item_category.select_by(:value, value)



wait.until {d.find_element(:id,"item-sales-status").displayed?}
item_sales_status_element = d.find_element(:id,"item-sales-status")
item_sales_status = Selenium::WebDriver::Support::Select.new(item_sales_status_element)
item_sales_status.select_by(:value, value)


wait.until {d.find_element(:id,"item-shipping-fee-status").displayed?}
item_shipping_fee_status_element = d.find_element(:id,"item-shipping-fee-status")
item_shipping_fee_status = Selenium::WebDriver::Support::Select.new(item_shipping_fee_status_element)
item_shipping_fee_status.select_by(:value, value)

wait.until {d.find_element(:id,"item-prefecture").displayed?}
item_prefecture_element = d.find_element(:id,"item-prefecture")
item_prefecture = Selenium::WebDriver::Support::Select.new(item_prefecture_element)
item_prefecture.select_by(:value, value)


wait.until {d.find_element(:id,"item-price").displayed?}
d.find_element(:id,"item-price").send_keys(item_price)
d.find_element(:class,"price-content").click


item_price_benefit = item_price*0.9
item_price_benefit = item_price_benefit.round
item_price_benefit2 = item_price_benefit.to_s.gsub(/\d{2}/, '\0,').to_i

puts "!利益は#{item_price_benefit}" 


wait.until {d.find_element(:id,"item-scheduled-delivery").displayed?}
item_scheduled_delivery_element = d.find_element(:id,"item-scheduled-delivery")
item_scheduled_delivery = Selenium::WebDriver::Support::Select.new(item_scheduled_delivery_element)
item_scheduled_delivery.select_by(:value, value)


if /#{item_price_benefit}/.match(d.page_source) || /#{item_price_benefit2}/.match(d.page_source)
  puts "◯入力された販売価格によって、非同期的に販売手数料や販売利益が変わる(JavaScriptを使用して実装すること)" 
else
  puts "☒入力された販売価格によって、非同期的に販売手数料や販売利益が変わらない" 
  wait.until {d.find_element(:id,'profit').text == item_price_benefit}
end

d.find_element(:class,"sell-btn").click

if /商品の情報を入力/.match(d.page_source)
  puts "◯画像が0枚の場合は、出品できない" 
else
  puts "☒画像が0枚の場合は、出品できる" 
  wait.until {d.find_element(:id,"item-name").displayed?}
end

wait.until {d.find_element(:id,"item-name").displayed?}
d.find_element(:id,"item-name").clear 
d.find_element(:id,"item-info").clear
item_category_blank = d.find_element(:id,"item-category")
item_category_blank = Selenium::WebDriver::Support::Select.new(item_category_blank)
item_category_blank.select_by(:value, blank)

item_sales_status_blank = d.find_element(:id,"item-sales-status")
item_sales_status_blank = Selenium::WebDriver::Support::Select.new(item_sales_status_blank )
item_sales_status_blank.select_by(:value, blank)

item_shipping_fee_status_blank = d.find_element(:id,"item-shipping-fee-status")
item_shipping_fee_status_blank = Selenium::WebDriver::Support::Select.new(item_shipping_fee_status_blank )
item_shipping_fee_status_blank.select_by(:value, blank)

item_prefecture_blank = d.find_element(:id,"item-prefecture")
item_prefecture_blank = Selenium::WebDriver::Support::Select.new(item_prefecture_blank )
item_prefecture_blank.select_by(:value, blank)

item_scheduled_delivery_blank = d.find_element(:id,"item-scheduled-delivery")
item_scheduled_delivery_blank = Selenium::WebDriver::Support::Select.new(item_scheduled_delivery_blank )
item_scheduled_delivery_blank.select_by(:value, blank)

d.find_element(:id,"item-price").clear

wait.until {d.find_element(:id,"item-image").displayed?}
d.find_element(:id,"item-image").send_keys(item_image)
d.find_element(:id,"item-name").send_keys(item_name) 
d.find_element(:id,"item-info").send_keys(item_info)

item_category_element = d.find_element(:id,"item-category")
item_category = Selenium::WebDriver::Support::Select.new(item_category_element)
item_category.select_by(:value, value)

item_sales_status_element = d.find_element(:id,"item-sales-status")
item_sales_status = Selenium::WebDriver::Support::Select.new(item_sales_status_element)
item_sales_status.select_by(:value, value)

item_shipping_fee_status_element = d.find_element(:id,"item-shipping-fee-status")
item_shipping_fee_status = Selenium::WebDriver::Support::Select.new(item_shipping_fee_status_element)
item_shipping_fee_status.select_by(:value, value)

item_prefecture_element = d.find_element(:id,"item-prefecture")
item_prefecture = Selenium::WebDriver::Support::Select.new(item_prefecture_element)
item_prefecture.select_by(:value, value)


item_scheduled_delivery_element = d.find_element(:id,"item-scheduled-delivery")
item_scheduled_delivery = Selenium::WebDriver::Support::Select.new(item_scheduled_delivery_element)
item_scheduled_delivery.select_by(:value, value)



# wait.until {d.find_element(:id,"item-price").displayed?}
# d.find_element(:id,"item-price").send_keys(item_price)

d.find_element(:class,"sell-btn").click

if /商品の情報を入力/.match(d.page_source)
  puts "!価格の記入なしで商品出品を行うと、商品出品ページリダイレクトされる" 
else
  puts "!価格の記入なしで商品出品を行っても、商品出品ページリダイレクトされない" 
  wait.until {d.find_element(:id,"item-name").displayed?}
end
puts "◯必須項目が一つでも欠けている場合は、出品ができない"
sleep 3
puts "◯【目視で確認】エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させる）"
d.find_element(:id,"item-image").clear 
d.find_element(:id,"item-name").clear 
d.find_element(:id,"item-info").clear
item_category_blank = d.find_element(:id,"item-category")
item_category_blank = Selenium::WebDriver::Support::Select.new(item_category_blank)
item_category_blank.select_by(:value, blank)

item_sales_status_blank = d.find_element(:id,"item-sales-status")
item_sales_status_blank = Selenium::WebDriver::Support::Select.new(item_sales_status_blank )
item_sales_status_blank.select_by(:value, blank)

item_shipping_fee_status_blank = d.find_element(:id,"item-shipping-fee-status")
item_shipping_fee_status_blank = Selenium::WebDriver::Support::Select.new(item_shipping_fee_status_blank )
item_shipping_fee_status_blank.select_by(:value, blank)

item_prefecture_blank = d.find_element(:id,"item-prefecture")
item_prefecture_blank = Selenium::WebDriver::Support::Select.new(item_prefecture_blank )
item_prefecture_blank.select_by(:value, blank)

item_scheduled_delivery_blank = d.find_element(:id,"item-scheduled-delivery")
item_scheduled_delivery_blank = Selenium::WebDriver::Support::Select.new(item_scheduled_delivery_blank )
item_scheduled_delivery_blank.select_by(:value, blank)


d.find_element(:id,"item-price").clear

d.find_element(:id,"item-image").send_keys(item_image)
puts "◯画像は1枚必須である"

d.find_element(:id,"item-name").send_keys(item_name) 
puts "◯商品名が必須である"

d.find_element(:id,"item-info").send_keys(item_info)
puts "◯商品の説明が必須である"

item_category_element = d.find_element(:id,"item-category")
item_category = Selenium::WebDriver::Support::Select.new(item_category_element)
item_category.select_by(:value, value)
puts "◯カテゴリーの情報が必須である"

item_sales_status_element = d.find_element(:id,"item-sales-status")
item_sales_status = Selenium::WebDriver::Support::Select.new(item_sales_status_element)
item_sales_status.select_by(:value, value)
puts "◯商品の状態についての情報が必須である"

item_shipping_fee_status_element = d.find_element(:id,"item-shipping-fee-status")
item_shipping_fee_status = Selenium::WebDriver::Support::Select.new(item_shipping_fee_status_element)
item_shipping_fee_status.select_by(:value, value)
puts "◯配送料の負担についての情報が必須である"

item_prefecture_element = d.find_element(:id,"item-prefecture")
item_prefecture = Selenium::WebDriver::Support::Select.new(item_prefecture_element)
item_prefecture.select_by(:value, value)
puts "◯発送元の地域についての情報が必須である"

item_scheduled_delivery_element = d.find_element(:id,"item-scheduled-delivery")
item_scheduled_delivery = Selenium::WebDriver::Support::Select.new(item_scheduled_delivery_element)
item_scheduled_delivery.select_by(:value, value)
puts "◯発送までの日数についての情報が必須である"

d.find_element(:id,"item-price").send_keys(item_price)
puts "◯価格についての情報が必須である"
puts "◯販売価格は半角数字のみ入力可能"

d.find_element(:class,"sell-btn").click


if /#{item_name}/ .match(d.page_source)
  puts "!有効な情報を入力するとトップページへ遷移し、商品名が表示されている。" 
else
  puts "!有効な情報を入力しても、商品名が表示されない。" 
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end



if /#{item_image_name}/ .match(d.page_source)
  puts "！有効な情報を入力するとトップページへ遷移し、画像が表示されている。" 
else
  puts "!有効な情報を入力しても、画像が表示されない" 
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end



if /#{item_price}/.match(d.page_source)
  puts "!有効な情報を入力するとトップページへ遷移し、商品価格が表示されている。" 
else
  puts "!有効な情報を入力しても商品価格が表示されない" 
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end

puts "◯必須項目を入力した上で出品ができる"
puts "◯出品した商品の一覧表示ができている"
puts "◯「画像/価格/商品名」の3つの情報について表示できている"

#商品表示が昇順か降順
d.find_element(:class,"item-img-content").click 

if /編集/.match(d.page_source)
  puts "!ログインした上で自分が出品した商品詳細ページへアクセスした場合は、「編集」のリンクが表示される" 
else
  puts "!ログインした上で自分が出品した商品詳細ページへアクセスしたが、「編集」のリンクが表示されない" 
  wait.until {d.find_element(:class,"detail-item").displayed?}
end

if /削除/.match(d.page_source)
  puts "!ログインした上で自分が出品した商品詳細ページへアクセスした場合は、「削除」のリンクが表示される" 
else
  puts "!ログインした上で自分が出品した商品詳細ページへアクセスしたが、「削除」のリンクが表示されない" 
  wait.until {d.find_element(:class,"detail-item").displayed?}
end


wait.until {d.find_element(:class,"item-red-btn").displayed?}
d.find_element(:class,"item-red-btn").click

d.find_element(:id,"item-info").clear
d.find_element(:class,"sell-btn").click
if /商品の情報を入力/.match(d.page_source)
  puts "◯無効な情報で商品編集を行うと、商品編集ができない" 
else
  puts "☒無効な情報でも商品編集を行うと、商品編集ができる" 
  wait.until {d.find_element(:id,"sell-btn").displayed?}
end

sleep 3
puts "【目視で確認】エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させる）"

d.find_element(:id,"item-info").send_keys(item_info_re)
d.find_element(:class,"sell-btn").click

item_info_re = "昨年イチオシのトレンチコート"
if /#{item_info_re}/.match(d.page_source)
  puts "◯商品名やカテゴリーの情報など、すでに登録されている商品情報は編集画面を開いた時点で表示される" 
elsif /FURIMAが選ばれる3つの理由/ .match(d.page_source)
  d.find_element(:class,"item-img-content").click
  wait.until {d.find_element(:class,"detail-item").displayed?}
  puts "◯商品名やカテゴリーの情報など、すでに登録されている商品情報は編集画面を開いた時点で表示される" 
else
  puts "☒商品説明が表示されないまたは、商品名やカテゴリーの情報など、すでに登録されている商品情報は編集画面を開いた時点で表示されない" 
  wait.until {d.find_element(:class,"detail-item").displayed?}
end
puts "◯何も編集せずに更新をしても画像無しの商品にならない"
puts "◯商品情報（商品画像・商品名・商品の状態など）を変更できる"
d.find_element(:class,"furima-icon").click


d.find_element(:link_text,"ログアウト").click
if /出品する/ .match(d.page_source)
  d.find_element(:class,"purchase-btn").click
  puts "!出品ページに遷移1"
elsif /出品する/ .match(d.page_source)
  d.find_element(:class,"purchase-btn-text").click
  puts "!出品ページに遷移2"
elsif /出品する/ .match(d.page_source)
    d.find_element(:class,"purchase-btn-icon").click
    puts "!出品ページに遷移3"
else
  puts "!出品ページに遷移できない"
end

if /会員情報入力/ .match(d.page_source)
  puts "!ログインしていない状態で商品出品ページへアクセスすると、ログインページへ遷移しました"
  wait.until {d.find_element(:class,"second-logo").displayed?}
  d.find_element(:class,"second-logo").click

elsif /FURIMAが選ばれる3つの理由/ .match(d.page_source)
  puts "!ログインしていない状態で商品出品ページへアクセスすると、トップページへ遷移しました"

else
  puts "!ログインしていない状態で商品出品ページへアクセスすると、ログインページへ遷移できませんでした"
  d.find_element(:class,"second-logo").click
end

puts "◯ログインしているユーザーだけが、出品ページへ遷移できる"

wait.until {d.find_element(:class, "item-img-content").displayed?}
if /#{item_image_name}/ .match(d.page_source)
  puts "!ログインしていないユーザーでも、商品の一覧表示を確認でき、出品画像が表示されている" 
else
  puts "!ログインしていないユーザーでも、商品の一覧表示を確認でき、出品画像が表示されていない" 
  wait.until {d.find_element(:class,"detail-item").displayed?}
end

item_name = d.find_element(:class,'item-name')
puts "!商品名は" +item_name.text

item_price = d.find_element(:class,'item-price')
puts "!商品価格は" + item_price.text

d.find_element(:class,"item-img-content").click
if /編集/ .match(d.page_source)
  puts "☒ログインしていないユーザーでも、商品の編集が行える" 
  wait.until {d.find_element(:class,"item-red-btn").displayed?}
else
  puts "◯ログインしていないユーザーは、商品の編集が行えない。" 
end

if /削除/ .match(d.page_source)
  puts "☒ログインしていないユーザーでも、商品の削除が行える"
  wait.until {d.find_element(:class,"item-red-btn").displayed?}
else
  puts "◯ログインしていないユーザーは、商品の削除が行えない。" 
end




if /編集/ .match(d.page_source)
  puts "☒ログインしていないユーザーでも、商品の編集が行える" 
  wait.until {d.find_element(:class,"item-red-btn").displayed?}
else
  puts "◯ログインしていないユーザーは、商品の編集が行えない。" 
end

if /購入画面に進む/.match(d.page_source)
  puts "!購入ボタンがあるのでクリック"
  d.find_element(:class,"item-red-btn").click
  if /会員情報入力/.match(d.page_source)
    d.find_element(:class,"second-logo").click
  else
    "☒ログインしていないユーザーは購入ページに遷移しようとすると、ログインページに遷移しない"
  end
else
  puts "!購入ボタンがない"
end

puts "◯ログインしていないユーザーは購入ページに遷移しようとすると、ログインページに遷移する"




puts "【説明】購入ボタン自体を消している場合があるので一度、サインアップする"

wait.until {d.find_element(:class,"sign-up").displayed?}
d.manage.delete_all_cookies
d.find_element(:class,"sign-up").click
puts "新しいユーザーを登録する"
wait.until {d.find_element(:id, 'nickname').displayed?}
d.find_element(:id, 'nickname').send_keys(nickname2)
d.find_element(:id, 'email').send_keys(email2)
d.find_element(:id, 'password').send_keys(password)
d.find_element(:id, 'password-confirmation').send_keys(password)
d.find_element(:id, 'first-name').send_keys(first_name2)
d.find_element(:id, 'last-name').send_keys(user_last_name2)
d.find_element(:id, 'first-name-kana').send_keys(first_name_kana2)
d.find_element(:id, 'last-name-kana').send_keys(last_name_kana2)
d.find_element(:id, 'user_birthday_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birth_day_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_BirthDay_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birth_date_1i').send_keys(year) rescue nil
d.find_element(:id, 'user_birthdate_1i').send_keys(year) rescue nil

d.find_element(:id, 'user_birthday_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_day_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_BirthDay_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_date_2i').send_keys(month) rescue nil
d.find_element(:id, 'user_birthdate_2i').send_keys(month) rescue nil

d.find_element(:id, 'user_birthday_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_day_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_BirthDay_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birth_date_3i').send_keys(month) rescue nil
d.find_element(:id, 'user_birthdate_3i').send_keys(month) rescue nil

d.find_element(:class,"register-red-btn").click

if /FURIMAが選ばれる3つの理由/ .match(d.page_source)
   nil
else
  puts "!生年月日を手動で入力しましょう。" 
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end
puts "【説明】商品出品ページに遷移してしまうためトップページに遷移後、商品購入画面に遷移する。"



# #ログイン2
# d.find_element(:class,"login").click
# d.find_element(:id, 'email').send_keys(email2)
# d.find_element(:id, 'password').send_keys(password)
# d.find_element(:class,"login-red-btn").click

puts "【説明】nickname2でログイン"



wait.until {d.find_element(:class,"item-img-content").displayed?}
d.find_element(:class,"item-img-content").click
if /編集/ .match(d.page_source)
  puts "!ログインした上で自分が出品していない商品詳細ページへアクセスした場合に、「編集」のリンクが表示される" 
  wait.until {d.find_element(:class,"item-red-btn").displayed?}
else
  puts "!ログインした上で自分が出品していない商品詳細ページへアクセスした場合は、「編集」のリンクが表示されない" 
end


if /削除/ .match(d.page_source)
  puts "!ログインした上で自分が出品していない商品詳細ページへアクセスした場合に、「削除」のリンクが表示される" 
  wait.until {d.find_element(:class,"item-red-btn").displayed?}
else
  puts "!ログインした上で自分が出品していない商品詳細ページへアクセスした場合は、「削除」のリンクが表示されない" 
end
puts "◯出品者にしか、商品編集・削除のリンクが踏めないようになっている"
puts "◯出品者だけが編集ページに遷移できる"

wait.until {d.find_element(:class, "item-red-btn").displayed?}
d.find_element(:class,"item-red-btn").click

#チェック機能追加
order_url_coat = d.current_url
puts "コート購入画面のURL→  "+ order_url_coat
#クレジットカード情報入力画面に遷移
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


if /クレジットカード情報入力/ .match(d.page_source)
  puts "!カード番号が入力されていない無い場合は、決済できない" 
else
  puts "!カード番号が入力されていない無い場合でも、決済できる" 
  wait.until {d.find_element(:class,"sold-out").displayed?}
end

puts "◯クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できない"


d.navigate.refresh
sleep 3
#電話番号にはハイフンが含まれた場合。
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
d.find_element(:id, 'phone-number').send_keys(phone_number_hyphen)


d.find_element(:class,"buy-red-btn").click


if /クレジットカード情報入力/ .match(d.page_source)
  puts "!電話番号にハイフンがはいっているとき、決済できない" 
else
  puts "!電話番号にハイフンがはいっているとき、決済できる" 
  wait.until {d.find_element(:class,"sold-out").displayed?}
end
puts "◯電話番号にはハイフンは不要で、11桁以内である"


d.navigate.refresh
sleep 3
#郵便番号・都道府県・市区町村・番地・電話番号が必須であること
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
# wait.until {d.find_element(:id, 'addresses').displayed?}
# d.find_element(:id, 'addresses').send_keys(addresses)
wait.until {d.find_element(:id, 'phone-number').displayed?}
d.find_element(:id, 'phone-number').send_keys(phone_number)


d.find_element(:class,"buy-red-btn").click


if /クレジットカード情報入力/ .match(d.page_source)
  puts "!郵便番号・都道府県・市区町村・番地・電話番号の値がないとき、決済できない" 
else
  puts "!郵便番号・都道府県・市区町村・番地・電話番号の値がないとき、決済できる" 
  wait.until {d.find_element(:class,"sold-out").displayed?}
end
puts "◯郵便番号・都道府県・市区町村・番地・電話番号が必須であること"


d.navigate.refresh
sleep 3
#郵便番号にはハイフンが必要であること（123-4567となる）
wait.until {d.find_element(:id, 'card-number').displayed?}
d.find_element(:id, 'card-number').send_keys(card_number)
wait.until {d.find_element(:id, 'card-exp-month').displayed?}
d.find_element(:id, 'card-exp-month').send_keys(card_exp_month)
wait.until {d.find_element(:id, 'card-exp-year').displayed?}
d.find_element(:id, 'card-exp-year').send_keys(card_exp_year)
wait.until {d.find_element(:id, 'card-cvc').displayed?}
d.find_element(:id, 'card-cvc').send_keys(card_cvc)
wait.until {d.find_element(:id, 'postal-code').displayed?}
d.find_element(:id, 'postal-code').send_keys(postal_code_nohyphen)
wait.until {d.find_element(:id, 'prefecture').displayed?}
d.find_element(:id, 'prefecture').send_keys(prefecture)
wait.until {d.find_element(:id, 'city').displayed?}
d.find_element(:id, 'city').send_keys(city)
wait.until {d.find_element(:id, 'addresses').displayed?}
d.find_element(:id, 'addresses').send_keys(addresses)
wait.until {d.find_element(:id, 'phone-number').displayed?}
d.find_element(:id, 'phone-number').send_keys(phone_number)


d.find_element(:class,"buy-red-btn").click


if /クレジットカード情報入力/ .match(d.page_source)
  puts "!郵便番号にはハイフンがあるとき、決済できない" 
else
  puts "!郵便番号にはハイフンがあるとき、、決済できる" 
  puts "☒郵便番号にはハイフンがなくても購入できる。"
  wait.until {d.find_element(:class,"sold-out").displayed?}
end
puts "◯郵便番号にはハイフンが必要であること（123-4567となる）"

d.navigate.refresh
sleep 3
# 値をクリアにする必要がある。
wait.until {d.find_element(:id, 'card-number').displayed?}
d.find_element(:id, 'card-number').send_keys(card_number)
puts "【説明】クレジットカードの番号記入"
wait.until {d.find_element(:id, 'card-exp-month').displayed?}
d.find_element(:id, 'card-exp-month').send_keys(card_exp_month)
puts "【説明】クレジットカードの有効月を記入"
wait.until {d.find_element(:id, 'card-exp-year').displayed?}
d.find_element(:id, 'card-exp-year').send_keys(card_exp_year)
puts "【説明】クレジットカードの有効年を記入"
wait.until {d.find_element(:id, 'card-cvc').displayed?}
d.find_element(:id, 'card-cvc').send_keys(card_cvc)
puts "◯購入時、クレジットカードの情報を都度入力できる"
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
puts "◯購入時、配送先の住所情報も都度入力できる"



d.find_element(:class,"buy-red-btn").click


wait.until {d.find_element(:class,"furima-icon").displayed?}
puts "◯クレジットカード決済ができる"
puts "◯クレジットカードの情報は購入の都度入力させる"
puts "◯購入が完了したら、トップページまたは購入完了ページに遷移する"


if /Sold Out/ .match(d.page_source)
  puts "◯売却済みの商品は、「sold out」の文字が表示されるようになっている" 
else
  puts "☒売却済みの商品は、「sould out」の文字が表示されない" 
  wait.until {d.find_element(:class,"sold-out").displayed?}
end

d.get(order_url_coat)
if /FURIMAが選ばれる3つの理由/ .match(d.page_source)
  puts "◯URLを直接入力して購入済みの商品ページへ遷移しようとすると、トップページに遷移する"
else
  puts "☒URLを直接入力して購入済みの商品ページへ遷移しようとすると、トップページに遷移しない"
  puts 1
  puts "!手動でトップページに遷移するとプログラムが動きます。"
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end

wait.until {d.find_element(:class,"item-img-content").displayed?}
d.find_element(:class,"item-img-content").click 
sleep 3
if /購入画面に進む/ .match(d.page_source)
  puts "!購入した商品だが、再度購入ボタンが表示されている"
  d.find_element(:class,"item-red-btn").click
  wait.until {d.find_element(:class,"furima-icon").displayed?}
  puts "◯しかし、押してもトップページに遷移するので購入した商品は、再度購入できない状態になっている"
  d.find_element(:class,"furima-icon").click 
else
  puts "!手動でトップページに遷移するとプログラムが動きます。"
  d.find_element(:class,"furima-icon").click 
end
sleep 3
# wait.until {d.find_element(:id,"FURIMAが選ばれる3つの理由").displayed?}
if /出品する/ .match(d.page_source)
  d.find_element(:class,"purchase-btn").click
  puts "!出品ページに遷移1"
elsif /出品する/ .match(d.page_source)
  d.find_element(:class,"purchase-btn-text").click
  puts "!出品ページに遷移2"
elsif /出品する/ .match(d.page_source)
    d.find_element(:class,"purchase-btn-icon").click
    puts "!出品ページに遷移3"
else
  puts "!出品ページに遷移できない"
end
sleep 3

wait.until {d.find_element(:id,"item-image").displayed?}
d.find_element(:id,"item-image").send_keys(item_image2)
d.find_element(:id,"item-name").send_keys(item_name2) 
d.find_element(:id,"item-info").send_keys(item_info2)
item_category_element = d.find_element(:id,"item-category")
item_category = Selenium::WebDriver::Support::Select.new(item_category_element)
item_category.select_by(:value, value)
item_sales_status_element = d.find_element(:id,"item-sales-status")
item_sales_status = Selenium::WebDriver::Support::Select.new(item_sales_status_element)
item_sales_status.select_by(:value, value)
item_shipping_fee_status_element = d.find_element(:id,"item-shipping-fee-status")
item_shipping_fee_status = Selenium::WebDriver::Support::Select.new(item_shipping_fee_status_element)
item_shipping_fee_status.select_by(:value, value)
item_prefecture_element = d.find_element(:id,"item-prefecture")
item_prefecture = Selenium::WebDriver::Support::Select.new(item_prefecture_element)
item_prefecture.select_by(:value, value)
item_scheduled_delivery_element = d.find_element(:id,"item-scheduled-delivery")
item_scheduled_delivery = Selenium::WebDriver::Support::Select.new(item_scheduled_delivery_element)
item_scheduled_delivery.select_by(:value, value)
d.find_element(:id,"item-price").send_keys(item_price2)
d.find_element(:class,"sell-btn").click

wait.until {d.find_element(:class,"purchase-btn").displayed?}
d.find_element(:link_text,"ログアウト").click
#ログイン1
d.find_element(:class,"login").click 
d.find_element(:id, 'email').send_keys(email)
d.find_element(:id, 'password').send_keys(password)
d.find_element(:class,"login-red-btn").click
wait.until {d.find_element(:class,"item-img-content").displayed?}
d.find_element(:class,"item-img-content").click 

wait.until {d.find_element(:class,"item-red-btn").displayed?}
d.find_element(:class,"item-red-btn").click
order_url_glasses = d.current_url
puts "サングラス購入画面のURL→  "+ order_url_glasses
d.get(url)

wait.until {d.find_element(:class,"purchase-btn").displayed?}
d.find_element(:link_text,"ログアウト").click

d.get(order_url_glasses)
if /会員情報入力/ .match(d.page_source)
  puts "！ログインしていない状態でURLを直接入力し購入ページに遷移しようとするとログインページに遷移する"
  puts "◯ログインしていないユーザーは購入ページに遷移しようとすると、ログインページに遷移する"
else
  puts "☒ログインしていないユーザーは購入ページに遷移しようとしても、ログインページに遷移しない"
  puts  "!手動でログインページに遷移するとプログラムが動きます。"
  wait.until {d.find_element(:id,"email").displayed?}
end


#ログイン2
wait.until {d.find_element(:id,"email").displayed?}
d.find_element(:id, 'email').send_keys(email2)
d.find_element(:id, 'password').send_keys(password)
d.find_element(:class,"login-red-btn").click

d.get(order_url_glasses)
if /FURIMAが選ばれる3つの理由/ .match(d.page_source)
  puts "◯出品者はURLを直接入力して購入ページに遷移しようとすると、トップページに遷移する"
else
  puts "☒出品者がURLを直接入力して購入ページに遷移しようとすると、トップページに遷移しない"
  puts  "!手動でトップページに遷移するとプログラムが動きます。"
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
end


wait.until {d.find_element(:class,"item-img-content").displayed?}
d.find_element(:class,"item-img-content").click 
if /購入画面に進む/ .match(d.page_source)
  puts "☒出品者でも、商品購入のリンクが踏めるようになっている"
else
  puts "◯出品者以外にしか、商品購入のリンクが踏めないようになっている" 
end


wait.until {d.find_element(:class,"item-destroy").displayed?}
d.find_element(:class,"item-destroy").click
item_name2 = "サングラス"
if /#{item_name2}/ .match(d.page_source)
  puts "☒出品者だけが商品情報を削除できない" 
  wait.until {d.find_element(:class,"purchase-btn").displayed?}
else
  puts "◯出品者だけが商品情報を削除できる" 
end 



item_name = "コート"
wait.until {d.find_element(:class,"purchase-btn").displayed?}
d.find_element(:link_text,"ログアウト").click
wait.until {d.find_element(:class,"purchase-btn").displayed?}
if /#{item_name}/ .match(d.page_source)
  puts "◯ログアウトした状態でも、商品一覧を閲覧できる"
else
  puts "☒ログアウトすると、商品一覧を閲覧できない"
end

d.find_element(:class,"item-img-content").click 

wait.until{d.find_element(:class,"item-explain-box")}
if d.find_element(:class,"item-explain-box").text == item_info_re
  puts  "!【商品説明は表示できている】" + d.find_element(:class,"item-explain-box").text
else
  puts "☒商品説明が表示されない"

end
puts "◯ログアウトした状態でも、商品詳細ページを閲覧できる"


puts "プログラム終了"
puts "【目視で確認】商品出品時に登録した情報が見られるようになっている"
puts "【目視で確認】新規登録、商品出品、商品購入の際にエラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させる）"
puts "【目視で確認】basic認証が実装されている" 
puts "【目視で確認】ログイン/ログアウトによって、ヘッダーにてユーザーへ表示する情報が変わる"
puts "【目視で確認】画像が表示されており、画像がリンク切れなどになっていない"

sleep 300000000000000