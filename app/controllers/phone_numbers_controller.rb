class PhoneNumbersController < ApplicationController
  before_action :find_person, only: [:new, :create, :edit, :update]
  before_action :find_phone_number, only: [:edit, :update, :destroy]
  def new
    @phone_number = PhoneNumber.new
    render layout: false
  end

  def create
    @phone_number = @person.phone_numbers.new(phone_number_params)
    unless @phone_number.save
      render js: "alert('Invalid input.');"
    end
  end

  def edit
    render layout: false
  end

  def update
    unless @phone_number.update(phone_number_params)
      render js: "alert('Invalid input.');"
    end
  end

  def destroy
    @phone_number.destroy
  end

  private
  def find_person
    @person = Person.find(params[:person_id])  
  end

  def find_phone_number
    @phone_number = PhoneNumber.find(params[:id])
  end

  def phone_number_params
    params.require(:phone_number).permit(:number)
  end
end
