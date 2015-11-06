class Place < ActiveRecord::Base
  belongs_to :mood
  belongs_to :category

  has_many :favorites, class_name:  "Favorite",
                                   foreign_key: "favorite_id",
                                   dependent:   :destroy
  mount_uploader :image, PlaceUploader
end
