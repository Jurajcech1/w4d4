class Track < ActiveRecord::Base
  validates :song, :track_designation, :album_id, presence: true

  belongs_to :album
  has_one :band,
    through: :album,
    source: :band

end
