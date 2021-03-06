class Album < ActiveRecord::Base
  validates :title, :recording_style, :band_id, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy


end
