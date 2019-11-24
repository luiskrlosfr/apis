class Trait < ApplicationRecord
  has_many :users, through: :abilities
end
