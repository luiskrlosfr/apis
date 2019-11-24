class CreateAbilities < ActiveRecord::Migration[6.0]
  def change
    create_table :abilities do |t|
      t.string :level
      t.references :user, null: false, foreign_key: true
      t.references :trait, null: false, foreign_key: true
      t.timestamps
    end
  end
end
