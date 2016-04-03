# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "ㄏㄏㄏ龍山寺食堂來囉(本檔案僅限用於無資料的時候）"

u = User.new
u.email = "admin@test.com"           # 可以改成自己的 email
u.password = "12345678"              # 最少要八碼
u.password_confirmation = "12345678" # 最少要八碼
u.is_admin = true
u.save


menu = Menu.new
menu.title = "龍山寺"
menu.phone = "86665333"
menu.introduction = "艋舺龍山寺，也稱萬華龍山寺或臺北龍山寺，簡稱龍山寺，位於臺灣臺北市萬華，是中華民國直轄市定古蹟，也是旅遊宗教勝地。艋舺龍山寺與艋舺清水巖和大龍峒保安宮合稱為臺北三大廟門"
menu.address = "台北市萬華區廣州街211號"
menu.delivery = "true"
menu.save

menu.build_photo.save
menu.photo.image.store!(File.open(File.join(Rails.root, 'public/longshan.jpg')))
menu.photo.save!

food = Food.new
food.menu_id = "1"
food.name = "義大利麵淫僧炒飯"
food.price = "100"
food.save

food1 = Food.new
food1.menu_id = "1"
food1.name = "牛肉麵"
food1.price = "180"
food1.save

food2 = Food.new
food2.menu_id = "1"
food2.name = "黃金泡菜"
food2.price = "30"
food2.save

food3 = Food.new
food3.menu_id = "1"
food3.name = "炸豆腐"
food3.price = "50"
food3.save

food4 = Food.new
food4.menu_id = "1"
food4.name = "牛肉燴飯"
food4.price = "90"
food4.save
