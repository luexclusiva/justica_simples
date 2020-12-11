class User < ApplicationRecord
  # belongs_to :judicial
  # belongs_to :user
  has_many :user_judicials
  has_many :judicials, through: :user_judicials
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
