class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  # GET /trains
  # GET /trains.json
  def index
    @trains = Train.all
  end

  # GET /trains/1
  # GET /trains/1.json
  def show
  end

  # GET /trains/new
  def new
    @train = Train.new
  end

  # GET /trains/1/edit
  def edit
  end

  # POST /trains
  def create
    @train = Train.new(train_params)

    if @train.save
      render :show, status: :created, location: [:admin, @train]
    else
      render json: @train.errors, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /trains/1
  def update
    if @train.update(train_params)
      render :show, status: :ok, location: @train
    else
      render json: @train.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trains/1
  # DELETE /trains/1.json
  def destroy
    @train.destroy
    redirect_to trains_url, notice: 'Train was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train
      @train = Train.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def train_params
      params.require(:train).permit(:number, :route_id, :wagons_order_asc)
    end
end
