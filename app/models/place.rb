class Place < ActiveRecord::Base
  belongs_to :mood
  belongs_to :category

  mount_uploader :image, PlaceUploader
end
