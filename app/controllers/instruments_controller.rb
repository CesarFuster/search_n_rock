class InstrumentsController < ApplicationController

  before_action :set_instrument, only: [:show, :edit, :update, :destroy]

  def index
    @instruments = Instrument.all
  end

  def show
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    if @instrument.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @instrument.update(instrument_params)
    if @instrument.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @instrument.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instruments).permit(:category, :brand, :description, :condition, :photo, :photo_cache, :day_value)
  end

end
