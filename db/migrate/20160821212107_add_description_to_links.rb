class AddDescriptionToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :description, :string
  end
end
