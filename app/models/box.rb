class Box < ApplicationRecord
  def attributes
    { id: nil, name: nil }
  end

  def destroy_all_history
    connects.each do |connect|
      new_history = Deletehistory.new
      new_history.user_id = connect.user_id
      new_history.title = connect.title
      new_history.link = connect.link

      if Deletehistory.find_by(link: new_history.link)
        old_history = Deletehistory.find_by(link: new_history.link)
        old_history.destroy
      end
      new_history.save
      histories_stock_limit = 20
      histories = Deletehistory.all
      histories[0].destroy if histories.count > histories_stock_limit
    end
  end

  validates :name, :position, presence: true

  belongs_to :user
  has_many :connects, dependent: :destroy
end
