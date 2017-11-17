# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

50.times do |index|
  Product.create!(
                        name: Faker::Lorem.sentence(3, false, 0).chop,
                        cost_in_usa_cents: Faker::Number.between(200, 3000),
                        country_of_origin: Faker::Lorem.sentence(2, false, 0).chop)
end

p "Created #{Product.count} products"

Review.destroy_all

max_product = Product.last.id

250.times do |index|
  Review.create!(
                        content_body: Faker::Lorem.sentence(25, false, 0).chop,
                        rating: Faker::Number.between(1, 5),
                        author: Faker::Lorem.sentence(2, false, 0).chop,
                        product_id: Faker::Number.between((max_product - 49), max_product))
end

p "Created #{Review.count} products"
