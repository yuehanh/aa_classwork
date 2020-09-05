# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# kitty = Cat.create(name: 'cat1', sex: 'M', birth_date: '2015/01/20', description: 'like balls', color:"orange")
# kitty2 = Cat.create(name: 'cat2', sex: 'F', birth_date: '2005/01/20', description: 'like balls may', color: "blue")
# kitty3 = Cat.create(name: 'cat3', sex:'F', birth_date: '2017/04/13', description: 'I love to play.', color: 'red')

# Kpop cats who quotes shakespeare

# 10.times do
#     colors = Cat::COLORS
#     color = colors[rand(colors.length)]

#     initial = {
#         name: Faker::Kpop.ii_groups,
#         sex: Faker::Gender.short_binary_type.upcase,
#         birth_date: Faker::Date.between(from: 10.years.ago, to: Date.today),
#         description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
#         color: color
#         }

#     Cat.create(initial)
# end


request1 = CatRentalRequest.new(cat_id: 3, start_date: Faker::Date.between(from: 10.days.ago, to: Date.today), end_date:Faker::Date.between(from: Date.today, to: 10.days.after))