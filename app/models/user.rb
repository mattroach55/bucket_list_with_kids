class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :destinations
  has_many :accommodations
  has_many :experiences
  has_many :reviews, through: :accommodations
  has_many :reviews, through: :experiences
  has_many :bucket_list_items

  # mount_uploader :photo, PhotoUploader
end
