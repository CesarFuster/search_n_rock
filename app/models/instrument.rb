class Instrument < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :category, inclusion: { in: ['drums', 'guitar', 'bass', 'violin', 'xylophone', 'keyboard', 'piano', 'cello', 'microphone', 'PA']}
  validates :condition, inclusion: { in: ['new', 'used']}
  validates :day_value, presence: true
end
