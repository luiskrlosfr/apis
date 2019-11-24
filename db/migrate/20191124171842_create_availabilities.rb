class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :day, null: false, foreign_key: true
      t.references :simple_time, null: false, foreign_key: true

      t.timestamps
    end
  end
end
