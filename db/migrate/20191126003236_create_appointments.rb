class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :address
      t.references :agent
      t.references :client
      t.references :availability, null: false, foreign_key: true
      t.timestamps
    end
    add_foreign_key :appointments, :users, column: :agent_id, primary_key: :id
    add_foreign_key :appointments, :users, column: :client_id, primary_key: :id
  end
end
