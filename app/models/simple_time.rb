class SimpleTime < ApplicationRecord
  has_many :days, through: :availability
  has_many :users, through: :availability
end
