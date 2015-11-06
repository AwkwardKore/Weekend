class Place < ActiveRecord::Base
  belongs_to :mood
  belongs_to :category
  belongs_to :user

  has_many :favorite_places

  mount_uploader :image, PlaceUploader

  def liked_by?(user_id)
    favorite_places.find_by(user_id: user_id).nil? ? false : true
  end
end
