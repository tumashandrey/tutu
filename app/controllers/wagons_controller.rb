class WagonsController < ApplicationController
  before_action :set_wagon, only: [:edit, :edit, :update, :destroy, :show]
  before_action :set_train, only: [:new, :create]
  
  # GET /wagons
  # GET /wagons.json
  def index
    @wagons = Wagon.all
  end

  # GET /wagons/1
  # GET /wagons/1.json
  def show
  end

  # GET /wagons/new
  def new
    @wagon = Wagon.new
  end

  # GET /wagons/1/edit
  def edit
  end

  # POST /wagons
  # POST /wagons.json
  def create
    @wagon = @train.wagons.new(wagon_params)

    if @wagon.save
      redirect_to @train, notice: 'wagon was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /wagons/1
  # PATCH/PUT /wagons/1.json
  def update
    if @wagon.update(wagon_params)
      redirect_to @wagon, notice: 'wagon was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wagons/1
  # DELETE /wagons/1.json
  def destroy
    @wagon.destroy
    redirect_to wagons_url, notice: 'wagon was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or conswagonts between actions.
    def set_wagon
      @wagon = Wagon.find(params[:id])
    end

    def set_train
      @train = Train.find(params[:train_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wagon_params
      params.require(:wagon).permit(:train_id, :up_seats, :down_seats, :side_up_seats, :side_down_seats, :seat_places, :wagon_type, :type)
    end
end
