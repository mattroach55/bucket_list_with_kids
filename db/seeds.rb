# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = 'db/blwkseed.csv'

user = User.first_or_initialize(username: "mr555", email: "matt@growx3.com", password: "testtest")
user.save

CSV.foreach(filepath, csv_options) do |row|
  if row['entity'] == 'destination'
    new_destination = Destination.new(user_id: user.id)
    new_destination.name = row['name']
    new_destination.entity = row['entity']
    new_destination.show = row['show']
    new_destination.description = row['description']
    new_destination.street_number = row['street_number']
    new_destination.street = row['street']
    new_destination.locality = row['locality']
    new_destination.country = row['country']
    new_destination.region = row['region']
    new_destination.latitude = row['latitude']
    new_destination.longitude = row['longitude']
    new_destination.photo = row['photo']
    new_destination.holiday_type = row['holiday_type']
    new_destination.theme = row['theme']
    new_destination.kids_age_from = row['kids_age_from']
    new_destination.kids_age_to = row['kids_age_to']
    new_destination.duration = row['duration']
    new_destination.price = row['price']
    new_destination.kids_club = row['kids_club']
    new_destination.kids_menu = row['kids_menu']
    new_destination.connecting_rooms = row['connecting_rooms']
    new_destination.pool = row['pool']
    new_destination.beach = row['beach']
    new_destination.bucket_list_count = row['bucket_list_count']
    new_destination.average_review_score = row['average_review_score']
    new_destination.booking_link = row['booking_link']
    new_destination.save!
  elsif row['entity'] == 'accommodation'
    new_accommodation = Accommodation.new(user_id: user.id)
    new_accommodation.destination = Destination.all.sample
    new_accommodation.name = row['name']
    new_accommodation.entity = row['entity']
    new_accommodation.show = row['show']
    new_accommodation.description = row['description']
    new_accommodation.street_number = row['street_number']
    new_accommodation.street = row['street']
    new_accommodation.locality = row['locality']
    new_accommodation.country = row['country']
    new_accommodation.region = row['region']
    new_accommodation.latitude = row['latitude']
    new_accommodation.longitude = row['longitude']
    new_accommodation.photo = row['photo']
    new_accommodation.holiday_type = row['holiday_type']
    new_accommodation.theme = row['theme']
    new_accommodation.kids_age_from = row['kids_age_from']
    new_accommodation.kids_age_to = row['kids_age_to']
    new_accommodation.duration = row['duration']
    new_accommodation.price = row['price']
    new_accommodation.kids_club = row['kids_club']
    new_accommodation.kids_menu = row['kids_menu']
    new_accommodation.connecting_rooms = row['connecting_rooms']
    new_accommodation.pool = row['pool']
    new_accommodation.beach = row['beach']
    new_accommodation.bucket_list_count = row['bucket_list_count']
    new_accommodation.average_review_score = row['average_review_score']
    new_accommodation.booking_link = row['booking_link']
    new_accommodation.save!
  else
    new_experience = Experience.new(user_id: user.id)
    new_experience.destination = Destination.all.sample
    new_experience.name = row['name']
    new_experience.entity = row['entity']
    new_experience.show = row['show']
    new_experience.description = row['description']
    new_experience.street_number = row['street_number']
    new_experience.street = row['street']
    new_experience.locality = row['locality']
    new_experience.country = row['country']
    new_experience.region = row['region']
    new_experience.latitude = row['latitude']
    new_experience.longitude = row['longitude']
    new_experience.photo = row['photo']
    new_experience.holiday_type = row['holiday_type']
    new_experience.theme = row['theme']
    new_experience.kids_age_from = row['kids_age_from']
    new_experience.kids_age_to = row['kids_age_to']
    new_experience.duration = row['duration']
    new_experience.price = row['price']
    new_experience.kids_club = row['kids_club']
    new_experience.kids_menu = row['kids_menu']
    new_experience.connecting_rooms = row['connecting_rooms']
    new_experience.pool = row['pool']
    new_experience.beach = row['beach']
    new_experience.bucket_list_count = row['bucket_list_count']
    new_experience.average_review_score = row['average_review_score']
    new_experience.booking_link = row['booking_link']
    new_experience.save!
  end
end


