class CreateApplicationTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :application_types do |t|
      t.string :name

      t.timestamps
    end

    ApplicationType.where(name: 'Telefonisk').first_or_create
    ApplicationType.where(name: 'Personligt').first_or_create
    ApplicationType.where(name: 'Skrifligt').first_or_create

  end
end
