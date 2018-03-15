class BucketListItem < ApplicationRecord
  belongs_to :accommodation, optional: true
  belongs_to :experience, optional: true
  belongs_to :destination
  belongs_to :user

  # def entity
  #   if accommodation_id != nil
  #     return "accommodation"
  #   elsif experience_id != nil
  #     return "experience"
  #   elsif destination_id != nil
  #     return "destination"
  #  end
  #end
end
