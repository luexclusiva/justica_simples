class UserJudicial < ApplicationRecord
  belongs_to :judicial
  belongs_to :user

  validates :judicial_id, uniqueness: true
end
