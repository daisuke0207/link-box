class Box < ApplicationRecord
  validates :name, :position, presence: true

  belongs_to :user
  has_many :connects
end
