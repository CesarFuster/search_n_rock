class ReviewsController < ApplicationController

  before_action :set_instrument, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = @instrument.user
    if @review.save
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  #def average
    #@user = @review.user
    #@all_user_reviews = @review.user.reviews
    #@review.user.reviews.each do |review|
      #r << review.rating
      #avg = r.reduce(:+).try(:to_f).try(:/,r.size)
     #end
     #avg
  #end

  private

  def set_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :author)
  end
end
