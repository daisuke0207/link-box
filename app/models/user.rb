class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  has_many :connects, dependent: :destroy
  has_many :boxes, dependent: :destroy
  has_many :deletehistory, dependent: :destroy
end
