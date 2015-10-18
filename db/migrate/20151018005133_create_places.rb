class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :location
      t.string :schedule
      t.string :description

      t.timestamps null: false
    end
  end
end
