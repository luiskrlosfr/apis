class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :days, through: :availability
  has_many :simple_times, through: :availability
  has_many :abilities
  has_many :client_appointments, class_name:'Appointment', foreign_key: 'client_id'
  has_many :agent_appointments, class_name:'Appointment', foreign_key: 'agent_id'

  belongs_to :region

  def client?
    return self.user_type == 'client'
  end

  def work_hours
    return Availability.where(user: self)
  end

  def appointments
    if self.client?
      return Appointment.where(client_id: self.id)
    else
      return Appointment.where(agent_id: self.id)
    end
  end
end
