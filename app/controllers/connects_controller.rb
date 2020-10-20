class ConnectsController < ApplicationController
  before_action :move_to_session, only: [:index]

  def index
    @connect = Connect.new
    @box = Box.find(params[:box_id])
    move_to_root
    @connects = @box.connects.includes(:user)
  end

  def create
    @box = Box.find(params[:box_id])
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
    box = Box.find(params[:box_id])
    if connect.destroy
      redirect_to box_connects_path(box)
    else
      render box_connects_path(box)
    end
  end

  private

  def connect_params
    params.require(:connect).permit(:title, :link, :position).merge(user_id: current_user.id)
  end

  def move_to_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_root
    unless current_user.id == @box.user_id
      redirect_to root_path 
    end
  end
end