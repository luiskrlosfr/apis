class AddNameToTrait < ActiveRecord::Migration[6.0]
  def change
    add_column :traits, :name, :string
  end
end
