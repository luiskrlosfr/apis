class CreateSimpleTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :simple_times do |t|
      t.time :hour
      t.timestamps
    end
  end
end
