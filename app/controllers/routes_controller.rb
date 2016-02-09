class RoutesController < ApplicationController
  def show
    @route = Route.find(params[:id])
  end
  
  def index
    @routes = Route.all
  end
  
  def new
    @route = Route.new
  end
  
  def create
    @route = Route.new(route_params)
    
    if @route.save
      redirect_to routes_path, notice: "Route was created"
    else
      render :new      
    end
  end
  
  def upate
  end
  
  private
  
  def route_params
    params.require(:route).permit(:name)
  end
end