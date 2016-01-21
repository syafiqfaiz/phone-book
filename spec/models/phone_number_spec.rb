require 'rails_helper'

RSpec.describe PhoneNumber, :type => :model do
  describe 'validation' do
    it 'is valid with valid phone number' do
      number = build(:phone_number)
      expect(number).to be_valid
    end
    it 'must be present' do
      number = build(:phone_number, number: nil)
      expect(number).to_not be_valid
    end
    it 'is invalid without person' do 
      number = build(:phone_number, person: nil)
      expect(number).to_not be_valid
    end
    it 'is invalid with non number' do
      number = build(:phone_number, number: '01325O623A')
      expect(number).to_not be_valid
    end
    it 'is invalid with less than 9 numbers' do
      number = build(:phone_number, number: '01325062')
      expect(number).to_not be_valid
    end
  end

  describe 'humanized number' do
    it 'returned humanized number' do
      number = build(:phone_number)
      expect(number.humanized_number).to eq('013 250 6234')
    end
  end
end
