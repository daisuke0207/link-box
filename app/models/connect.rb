class Connect < ApplicationRecord
  validates :title, :link, :position, presence: true
  belongs_to :user
  belongs_to :box

  def delete_history
    new_history = Deletehistory.new
    new_history.user_id = user_id
    new_history.title = title
    new_history.link = link

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
