class WelcomesController < ApplicationController
  def index
    @people = Person.all
  end
end
