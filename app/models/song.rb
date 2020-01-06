class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, inclusion: {in: [true, false]}
  with_options if: :released do |s|
      s.validates :release_year, presence: true
      s.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
  end

  validates :title, uniqueness: {scope: %i[release_year artist_name]}
end
