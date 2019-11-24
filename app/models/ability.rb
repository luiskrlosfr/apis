class Ability < ApplicationRecord
  belongs_to :user
  belongs_to :trait
end
