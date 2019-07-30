class CreateApplicationTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :application_types do |t|
      t.string :name

      t.timestamps
    end

    ApplicationType.where(name: 'telefonisk').first_or_create
    ApplicationType.where(name: 'personligt').first_or_create
    ApplicationType.where(name: 'gennem ansøgning').first_or_create

  end
end
