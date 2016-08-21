class AddTitleToEmailLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :email_links, :title, :string
  end
end
