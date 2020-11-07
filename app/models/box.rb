class Box < ApplicationRecord
  def attributes
    { id: nil, name: nil }
  end

  validates :name, :position, presence: true

  belongs_to :user
  has_many :connects, dependent: :destroy
end
