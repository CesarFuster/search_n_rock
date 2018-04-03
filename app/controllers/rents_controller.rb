class RentsController < ApplicationController

  before_action :set_instrument, only: [:show]


  def index
    @rents = Rent.all
  end

  def show
  end

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(instrument_params)
    @rent.user = current_user
    if @rent.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def rent_params
    params.require(:rents).permit(:start_date, :end_date, :total_value, :instrument_id)
  end

end
