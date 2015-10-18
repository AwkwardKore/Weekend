class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :user
      t.string :pwd
      t.string :mail

      t.timestamps null: false
    end
  end
end
