class Rent < ApplicationRecord
  belongs_to :instrument
  belongs_to :user

  def value
    days = (end_date - start_date).to_i
    total = days * instrument.day_value
    total.to_s
  end
end
