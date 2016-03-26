class Admin::TicketsController < Admin::BaseController
  before_action :authenticate_user!, only: :create
  before_action :set_ticket, only: [:edit, :edit, :update, :destroy]
  
  # GET /tickets
  # GET /tickets.json
  def index
      @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new()
    
    @ticket.train_id = params[:train_id]
    @ticket.start_railway_station_id = params[:start_railway_station_id]
    @ticket.finish_railway_station_id = params[:finish_railway_station_id]
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end
  
  def get_user
    @user = User.find_or_create_by(fio: params['fio'], passport: params['passport'])
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or consticketts between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params.require(:ticket).permit(:train_id, :start_railway_station_id, :finish_railway_station_id, user_attributes: [:fio, :passport])
  end
end
