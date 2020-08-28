# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'Create Users'
User.destroy_all
user1 = User.create(email: Faker::Internet.email)
user2 = User.create(email: Faker::Internet.email)

p 'create long emails'
ShortenedUrl.destroy_all
10.times do
    ShortenedUrl.generate(user1, Faker::Internet.url)
end

#destory all doesnt destory db