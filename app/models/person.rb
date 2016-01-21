class Person < ActiveRecord::Base
  has_many :phone_numbers
  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def self.to_csv_file(people)
    var = CSV.generate(headers: true) do |csv|
      csv << %w{id name phone_numbers}

      people.each do |person|
        csv << [person.id, person.name, person.phone_numbers_csv]
      end
    end
    var
  end

  def phone_numbers_csv
    self.phone_numbers.pluck(:number).join('-')
  end
end
