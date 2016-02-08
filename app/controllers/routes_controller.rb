class RoutesController < ApplicationController
  def show
    
  end
  
  def index
    @routes = Route.all
  end
end