class ConnectsController < ApplicationController
  before_action :move_to_session, only: %i[index]
  before_action :set_box, only: %i[index create destroy]

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
    @connect = Connect.find(params[:id])
    @connect.delete_history
    if @connect.destroy
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
                         current_user.connects.where('title LIKE ?', "%#{params[:title]}%")
                       else
                         current_user.connects.none
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

  def destroy_all_history(connects)
    connects.each(&:delete_history)
  end
end
