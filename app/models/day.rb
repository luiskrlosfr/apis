class Day < ApplicationRecord
  has_many :users, through: :availability
  has_many :simple_times, through: :availability
end
