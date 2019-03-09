# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Category.destroy_all
MoneyRecord.destroy_all

user = User.new(first_name: "Caitlin", last_name: "Prentke", email: "caitlin@example.com")
user.password = "password"
user.save

user_id = user.id

category_data = [
  {
    name: "Groceries",
    color_hex: "#61A243",
    category_type: "spend",
  },
  {
    name: "Eating & Drinking Out",
    color_hex: "#E356BA",
    category_type: "spend",
  },
  {
    name: "Transport",
    color_hex: "#C7BAC3",
    category_type: "spend",
  },
  {
    name: "Bills",
    color_hex: "FF2A00",
    category_type: "spend",
  },
  {
    name: "Boring Stuff",
    color_hex: "#00247C",
    category_type: "spend",
  },
  {
    name: "Fun Stuff",
    color_hex: "#4C7FFC",
    category_type: "spend",
  },
  {
    name: "Boring Non-Stuff",
    color_hex: "#9100B1",
    category_type: "spend",
  },
  {
    name: "Fun Non-Stuff",
    color_hex: "#DB39FF",
    category_type: "spend",
  },
  {
    name: "Salary",
    color_hex: "#137625",
    category_type: "incoming",
  },
  {
    name: "Misc.",
    color_hex: "#77EAD2",
    category_type: "incoming",
  },
]

category_data.each do |cat|
  category = Category.new(cat)
  category.user_id = user_id
  category.save
end


98.times do |i|
  category = Category.all.sample
  MoneyRecord.create(
    description: "Record #{i}",
    date: Date.today - i.days,
    amount: rand(0.0...1500.00),
    record_type: category.category_type,
    user_id: user_id,
    category_id: category.id,
  )
end
