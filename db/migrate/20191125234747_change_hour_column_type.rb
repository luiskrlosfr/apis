class ChangeHourColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :simple_times, :hour, :string
  end
end
