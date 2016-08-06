class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :from_name
      t.string :from_email
      t.string :subject
      t.text :html

      t.timestamps
    end
  end
end
