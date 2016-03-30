class HomeController < ApplicationController
  layout 'application'
  def index
    @faculties = Faculty.active.order(:short)
  end
end
