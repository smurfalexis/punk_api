class Beer < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :abv
  validates_presence_of :description
  validates_presence_of :food
  validates_presence_of :image

  include PgSearch::Model
  pg_search_scope :search_by_keyword,
                  against: %i[name description],
                  using: {
                    tsearch: { prefix: true }
                  }
end
