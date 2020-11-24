require 'selenium-webdriver'

d = Selenium::WebDriver.for :chrome
d.manage.timeouts.implicit_wait = 600
d.navigate.to "https://google.com/"

# ターミナルへページタイトルを出力
puts d.title

#閉じる
d.quit

# d.find_element(:id, 'user_birthday_1i').send_keys(year) rescue nil
# d.find_element(:id, 'user_birth_day_1i').send_keys(year) rescue nil
# d.find_element(:id, 'user_BirthDay_1i').send_keys(year) rescue nil
# d.find_element(:id, 'user_birth_date_1i').send_keys(year) rescue nil

# d.find_element(:id, 'user_birthday_2i').send_keys(month) rescue nil
# d.find_element(:id, 'user_birth_day_2i').send_keys(month) rescue nil
# d.find_element(:id, 'user_BirthDay_2i').send_keys(month) rescue nil
# d.find_element(:id, 'user_birth_date_2i').send_keys(month) rescue nil

# d.find_element(:id, 'user_birthday_3i').send_keys(month) rescue nil
# d.find_element(:id, 'user_birth_day_3i').send_keys(month) rescue nil
# d.find_element(:id, 'user_BirthDay_3i').send_keys(month) rescue nil
# d.find_element(:id, 'user_birth_date_3i').send_keys(month) rescue nil