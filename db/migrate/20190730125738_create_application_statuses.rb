class CreateApplicationStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :application_statuses do |t|
      t.string :name

      t.timestamps
    end

    ApplicationStatus.where(name: 'afventer').first_or_create
    ApplicationStatus.where(name: 'jobsamtale').first_or_create
    ApplicationStatus.where(name: 'afvist').first_or_create
  end
end
