class Deletehistory < ApplicationRecord
  belongs_to :user
  belongs_to :connect
end
