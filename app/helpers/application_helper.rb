module ApplicationHelper
  def delete_history_get
    delete_histories = Deletehistory.includes(:user).order(id: 'DESC')
    delete_histories
  end
end
