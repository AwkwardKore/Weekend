class AddTipToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :tips, :string
  end
end
