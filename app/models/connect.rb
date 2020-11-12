class Connect < ApplicationRecord
  validates :title, :link, :position, presence: true
  belongs_to :user
  belongs_to :box
  has_many :deletehistory, dependent: :destroy
end
