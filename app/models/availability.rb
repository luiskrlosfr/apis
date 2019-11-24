class Availability < ApplicationRecord
  belongs_to :user
  belongs_to :day
  belongs_to :simple_time
end
