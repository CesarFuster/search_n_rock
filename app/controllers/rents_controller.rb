class RentsController < ApplicationController

  before_action :set_instrument, only: [:show, :new, :create]

  def index
    @rents = Rent.all
  end

  def show
  end

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.instrument = @instrument
    @rent.user = current_user
    if @rent.save!
      redirect_to instrument_rents_path(@instrument)
    else
      render :new
    end
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end

  def rent_params
    params.require(:rent).permit(:start_date, :end_date, :total_value, :instrument_id)
  end

end
