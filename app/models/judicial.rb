class Judicial < ApplicationRecord
  has_many :judicial_steps, dependent: :destroy
  has_many :parties
  has_many :userjudicials

  include PgSearch::Model
  pg_search_scope :search_by_parties_name_and_jud_number,
                  against: %i[number],
                  associated_against: {
                    parties: [:name]
                  },
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
