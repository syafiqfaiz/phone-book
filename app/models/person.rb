class Person < ActiveRecord::Base
  has_many :phone_numbers
  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
