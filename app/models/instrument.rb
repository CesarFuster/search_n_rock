class Instrument < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy
  mount_uploader :photo, PhotoUploader
end
