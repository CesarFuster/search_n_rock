class InstrumentsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]

  def index
    @instruments = Instrument.search_by_category_and_brand("#{params[:query]}")

    @instruments = Instrument.all if @instruments.count.zero?

    @markers = []
    @instruments.each do |instrument|
      marker = { lat: instrument.user.latitude, lng: instrument.user.longitude }
      @markers << marker if instrument.user.latitude.present? && instrument.user.longitude.present?
    end

  end

  def show
    @rent = Rent.new
    @review = Review.new
    @reviews = @instrument.user.reviews
    @ave_review = Review.where(user_id: @instrument.user).average(:rating)
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  def edit
    if @instrument.user != current_user
      redirect_to root_path
    end
  end

  def update
    if @instrument.user != current_user
      redirect_to root_path
    else
      @instrument.update(instrument_params)
      if @instrument.save
        redirect_to instruments_path
      else
        render :new
      end
    end
  end

  def destroy
    if @instrument.user != current_user
      flash[:alert] = "Esse instrumento nao é seu"
      render :show
    else
      @instrument.destroy
      redirect_to instruments_path
    end
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:category, :brand, :description, :condition, :photo, :photo_cache, :day_value)
  end

end
