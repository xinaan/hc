class HomeController < ApplicationController
  layout 'application'
  def index
    @faculty = Faculty.active
  end
end
