class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :phone_number
      t.string :specialization

      t.timestamps
    end
  end
end
