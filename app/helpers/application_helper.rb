module ApplicationHelper
  def delete_history_get
    delete_histories = current_user.Deletehistory.includes(:user).order(id: 'DESC')
    delete_histories
  end
end
