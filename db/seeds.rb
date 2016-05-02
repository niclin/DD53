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

o = OfficialHolidayOption.new
o.name = "星期一"
o.save

o = OfficialHolidayOption.new
o.name = "星期二"
o.save

o = OfficialHolidayOption.new
o.name = "星期三"
o.save

o = OfficialHolidayOption.new
o.name = "星期四"
o.save

o = OfficialHolidayOption.new
o.name = "星期五"
o.save

o = OfficialHolidayOption.new
o.name = "星期六"
o.save

o = OfficialHolidayOption.new
o.name = "星期日"
o.save
