class AddRegionReferenceToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :region, index: true
  end
end
