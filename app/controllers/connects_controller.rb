class ConnectsController < ApplicationController
  def index
    @connect = Connect.new
    @box = Box.find(params[:box_id])
    @connects = @box.connects.includes(:user)
  end

  def create
    @box = Box.find(params[:box_id])
    @connect = @box.connects.new(connect_params)
    if @connect.save
      redirect_to box_connects_path(@box)
    else
      render :index
    end
  end

  private

  def connect_params
    params.require(:connect).permit(:title, :link, :position).merge(user_id: current_user.id)
  end
end