class Appointment < ApplicationRecord
  belongs_to :agent, class_name: 'User'
  belongs_to :client, class_name: 'User'
  belongs_to :availability
end
