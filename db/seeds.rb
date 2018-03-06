
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating a user...'

user = User.create(email:'test@test.com', password: 'fkdfksfh')
experience = Experience.create(name: 'Test', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse imperdiet dapibus dolor et dignissim. Praesent sit amet pellentesque nisi, id consectetur mauris. Sed eget massa interdum, ultricies diam quis, ultrices est. Donec pretium egestas purus vel suscipit. Vivamus et efficitur arcu. Fusce porta, massa a cursus gravida, velit leo gravida massa, nec tincidunt ipsum lectus quis sem. Aenean nec mi interdum, tincidunt ipsum et, pharetra lorem.', address: 'Paris', user: user)
puts experience.valid?

puts 'Finished....'
 user = User.create(email: 'test2@test.com', password: 'password')
 destination = Destination.create(name: 'Test', street_number: '123' address: 'main' country: 'United States' region: 'California' description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et pain magna aliqua, Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex and com')
    t.string "name"
    t.string "description"
    t.string "street_number"
    t.string "address"
    t.string "locality"
    t.string "country"
    t.string "region"
    t.float "latitude"
    t.float "longitude"
    t.string "photo"
    t.string "type"
    t.string "holiday_type"
    t.string "theme"
    t.integer "kids_age_from"
    t.integer "kids_age_to"
    t.integer "duration"
    t.float "price"
    t.integer "bucket_list_count"
    t.integer "average_review_score"
