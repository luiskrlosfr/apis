class DropTableTrait < ActiveRecord::Migration[6.0]
  def change
    drop_table :traits
  end
end
