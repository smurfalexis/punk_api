class Beer < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_keyword,
                  against: %i[name description],
                  using: {
                    tsearch: { prefix: true }
                  }
end
