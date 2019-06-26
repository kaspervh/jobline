class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :name
      t.string :position
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
