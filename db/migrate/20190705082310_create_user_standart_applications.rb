class CreateUserStandartApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_standart_applications do |t|
      t.integer :user_id
      t.text :application

      t.timestamps
    end
  end
end
