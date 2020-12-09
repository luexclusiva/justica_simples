class UserJudicial < ApplicationRecord
  belongs_to :judicial
  belongs_to :user
end
