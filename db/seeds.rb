# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})

cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 0,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 0,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
})

## USERS

puts "Creating Users ..."

User.create!({
  first_name: 'Bob',
  last_name: 'Ross',
  email: 'bob@bob.com',
  password: 'bob',
  password_confirmation: 'bob'
})

User.create!({
  first_name: 'John',
  last_name: 'Doe',
  email: 'john@john.com',
  password: 'john',
  password_confirmation: 'john'
})

User.create!({
  first_name: 'Slim',
  last_name: 'Jim',
  email: 'slim@slim.com',
  password: 'slim',
  password_confirmation: 'slim'
})

User.create!({
  first_name: 'Jordan',
  last_name: 'Youngs',
  email: 'test@test.com',
  password: 'test',
  password_confirmation: 'test'
})

## REVIEWS

puts "Creating Reviews ..."

(1..12).each do |i|
  Review.create!({
    user_id: 1,
    product_id: i,
    description: Faker::GreekPhilosophers.quote,
    rating: rand(1..5)
  })
end

(1..12).each do |i|
  Review.create!({
    user_id: 2,
    product_id: i,
    description: Faker::ChuckNorris.fact,
    rating: rand(1..5)
  })
end

(1..12).each do |i|
  Review.create!({
    user_id: 3,
    product_id: i,
    description: Faker::Simpsons.quote,
    rating: rand(1..5)
  })
end

## AVERAGE RATINGS

(1..12).each do |i|
  product = Product.find(i)
  product.update!(average_rating: product.reviews.average(:rating).round(1))
end

## ORDERS

puts "Creating Orders ..."

order1 = Order.new({
  total_cents: 553575,
  stripe_charge_id: "ch_1DBPcUGI3L7adIQDzi7mlxMs",
  email: "bob@bob.com"
})

order1.line_items.new({
  product_id: 10,
  quantity: 1,
  item_price_cents: 305200,
  total_price_cents: 305200
})

order1.line_items.new({
  product_id: 12,
  quantity: 1,
  item_price_cents: 248375,
  total_price_cents: 248375
})

order1.save!

order2 = Order.create({
  total_cents: 267450,
  stripe_charge_id: "ch_1DBPdEGI3L7adIQDMDz5RODv",
  email: "anonymous@example.com"
})

order2.line_items.new({
  product_id: 5,
  quantity: 2,
  item_price_cents: 122500,
  total_price_cents: 245000
})

order2.line_items.new({
  product_id: 6,
  quantity: 1,
  item_price_cents: 22450,
  total_price_cents: 22450
})

order2.save!

puts "DONE!"
