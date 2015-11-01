class Place < ActiveRecord::Base
  belongs_to :mood
  belongs_to :category

  validates :name, :location, :schedule, :description, :mood_id, :category_id, :image, presence: true

  mount_uploader :image, PlaceUploader
end
