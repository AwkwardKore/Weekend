class CreateFavoritePlaces < ActiveRecord::Migration
  def change
    create_table :favorite_places do |t|
      t.integer :place_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
