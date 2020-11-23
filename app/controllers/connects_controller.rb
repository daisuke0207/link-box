class ConnectsController < ApplicationController
  before_action :move_to_session, only: [:index]
  before_action :set_box, only: [:index, :create, :destroy]

  def index
    @connect = Connect.new
    move_to_root
    @connects = @box.connects.includes(:user)
  end

  def create
    @connect = @box.connects.new(connect_params)
    if @connect.save
      redirect_to box_connects_path(@box)
    else
      @connects = @box.connects.includes(:user)
      render :index
    end
  end

  def destroy
    connect = Connect.find(params[:id])
    delete_history(connect)
    if connect.destroy
      redirect_to box_connects_path(@box)
    else
      render box_connects_path(@box)
    end
  end

  def destroy_all
    box = Box.find(params[:box_id])
    connects = box.connects
    destroy_all_history(connects)
    if connects.destroy_all
      redirect_to box_connects_path(box)
    else
      render edit_box_path(box)
    end
  end

  def search
    @search_connects = if params[:title].present?
                         Connect.where('title LIKE ?', "%#{params[:title]}%")
                       else
                         Connect.none
                       end
  end

  private

  def connect_params
    params.require(:connect).permit(:title, :link, :position).merge(user_id: current_user.id)
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_root
    redirect_to root_path unless current_user.id == @box.user_id
  end

  def set_box
    @box = Box.find(params[:box_id])
  end

  def delete_history(connect)
    new_history = Deletehistory.new
    new_history.user_id = current_user.id
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

  def destroy_all_history(connects)
    connects.each do |connect|
      new_history = Deletehistory.new
      new_history.user_id = current_user.id
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
end
