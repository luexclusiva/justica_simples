class Judicial < ApplicationRecord
  has_many :judicial_steps, :dependent => :destroy
end
