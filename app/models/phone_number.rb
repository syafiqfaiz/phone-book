class PhoneNumber < ActiveRecord::Base
  belongs_to :person
  validates :number, presence: true
  validates :number, format: { with: /\d{8,}[^\D]/, message: "invalid phone number" }
  validates :person, presence: true

  def humanized_number
    number.insert(-5, ' ').insert(-9, ' ')
  end
end
