require 'rails_helper'

RSpec.describe Person, :type => :model do
  describe 'validation' do
    it 'is valid with first name and last name' do
      person = build(:person)
      expect(person).to be_valid
    end

    it 'is invalid without first name' do
      person = build(:person, first_name: nil)
      expect(person).to_not be_valid
    end
    it 'is invalid without last name' do
      person = build(:person, last_name: nil)
      expect(person).to_not be_valid
    end
  end

  describe 'name' do
    it 'return full name' do
      person = build(:person)
      expect(person.name).to eq('First Last')
    end
  end
end
