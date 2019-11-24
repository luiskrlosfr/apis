class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :days, through: :availability
  has_many :simple_times, through: :availability
  has_many :abilities
  belongs_to :region

  def client?
    return self.user_type == 'client'
  end

  def work_hours
    return Availability.where(user: self)
  end
end
