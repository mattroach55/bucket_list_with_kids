
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
