class Deletehistory < ApplicationRecord
  validates :title, :link, presence: true
  belongs_to :user
end
