class Connect < ApplicationRecord
  validates :title, :link, :position, presence: true
  belongs_to :user
  belongs_tp :room
end
