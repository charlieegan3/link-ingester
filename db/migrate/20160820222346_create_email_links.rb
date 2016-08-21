class CreateEmailLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :email_links do |t|
      t.references :email, foreign_key: true
      t.references :link, foreign_key: true
      t.string :source_url

      t.timestamps
    end
  end
end
