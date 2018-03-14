class User < ApplicationRecord
  # after_create :subscribe_to_newsletter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :destinations
  has_many :accommodations
  has_many :experiences
  has_many :accomodation_reviews, through: :accommodations, class_name: 'Review'
  has_many :experience_reviews, through: :experiences, class_name: 'Review'
  has_many :bucket_list_items

  acts_as_voter

  mount_uploader :photo, PhotoUploader



  # private

  # def subscribe_to_newsletter
  #   SubscribeToNewsletterService.new(self).call
  # end
end
