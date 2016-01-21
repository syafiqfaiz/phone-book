class PeopleController < ApplicationController
  before_action :find_person, only: [:edit, :update, :destroy]

  def new
    @person = Person.new
    render layout: false
  end

  def create
    @person = Person.new(person_params)
    unless @person.save
      render js: "alertFunction('Invalid input.');"
    end
  end

  def edit
    render layout: false
  end

  def update
    @person.update(person_params)
    unless @person.save
      render js: "alertFunction('Invalid input.');"
    end
  end

  def destroy
    @person.destroy
  end

  private

  def find_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end
end
