# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category_list=[{name: "中式料理"},{name: "日式料理"}, {name: "美式料理"}, {name: "歐風餐廳"}, {name: "台灣小吃"}, {name: "泰式料理"}, {name: "其他"}]
category_list.each do |c|
	Category.create(name: c[:name])
end

User.create(email: "root@com", password: "root", role: "admin")
User.create(email: "test@com", password: "test")

puts"default Admin User and Category List"