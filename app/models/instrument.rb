class Instrument < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :category, inclusion: { in: ['drums', 'guitar', 'bass', 'violin', 'xylophone', 'keyboard', 'piano', 'cello', 'microphone']}
  validates :condition, inclusion: { in: ['new', 'used']}
  validates :day_value, presence: true
  validates :photo, presence: true

  include PgSearch
  pg_search_scope :search_by_category_and_brand,
    against: [ :category, :brand ],
    using: {
      tsearch: { prefix: true }
    }
end
