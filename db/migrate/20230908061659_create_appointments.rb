class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.references :doctor, null: false, foreign_keys: true
      t.references :patient, null: false, foreign_keys: true


      t.timestamps
    end
  end
end
