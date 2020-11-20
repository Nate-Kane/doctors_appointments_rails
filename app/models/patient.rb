class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  # defining our full_name method for our show methods
end
