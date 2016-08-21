class AddHnStatusToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :hn_status, :boolean
  end
end
