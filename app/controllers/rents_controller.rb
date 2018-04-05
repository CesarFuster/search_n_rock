class RentsController < ApplicationController

  before_action :set_instrument, only: [:new, :create]
  before_action :set_rent, only: [:show]

  def index
    @rents = Rent.all
  end

  def show
    @instrument = @rent.instrument
    @all_user_rents = @rent.user.rents
  end

  def new
    if @instrument.user == current_user
      redirect_to instrument_path(@instrument)
    else
      @rent = Rent.new
    end
  end

  def create
    if @instrument.user == current_user
      redirect_to instrument_path(@instrument)
    else
      @rent = Rent.new(rent_params)
      @rent.instrument = @instrument
      @rent.user = current_user
      @rent.total_value = @rent.value
        if @rent.save!
          redirect_to rent_path(@rent)
        else
          render :new
        end
    end
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end

  def set_rent
    @rent = Rent.find(params[:id])
  end

  def rent_params
    params.require(:rent).permit(:start_date, :end_date, :total_value, :instrument_id)
  end

end
