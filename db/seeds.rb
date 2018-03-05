# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating experiences...'
Experience.create(name: 'Kitsurfing', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum suscipit ut augue ut rutrum. Nunc vel felis mauris. Cras ultricies rhoncus mauris, ac iaculis velit vehicula ut. Sed iaculis elementum lorem, vehicula convallis sem dictum id. Aliquam pharetra arcu a nibh semper euismod. Fusce nibh enim, commodo eu aliquet a, hendrerit vel lectus. Vivamus ut libero quis odio dictum mattis sit amet sit amet nisi. Nunc laoreet augue dolor, a molestie lacus sollicitudin vel. Vestibulum iaculis id tortor tempor viverra. Aenean eu sagittis elit. Sed orci sapien, blandit id odio nec, elementum blandit nulla. In ullamcorper felis et lacinia dignissim. Nullam suscipit dolor sed fermentum ultricies. Nunc ultricies bibendum nunc eget volutpat. Vestibulum vitae faucibus neque.', address: 'New York', duration: '2', bucket_list_count: '4', average_review_score: '4')
puts 'Finished.'
