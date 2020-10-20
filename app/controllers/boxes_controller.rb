class BoxesController < ApplicationController
  before_action :move_to_session, only: [:edit]

  def index
    @boxes = Box.includes(:user)
  end

  def create
    box = Box.create(name: params[:name], position: 1, user_id: current_user.id)
    render json: { box: box }
  end

  def edit
    @box = Box.find(params[:id])
    move_to_root
  end

  def update
    box = Box.find(params[:id])
    if box.update(box_params)
      redirect_to box_connects_path(box)
    else
      render :edit
    end
  end

  def destroy
    box = Box.find(params[:id])
    if box.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def box_params
    params.require(:box).permit(:name, :position).merge(user_id: current_user.id)
  end

  def move_to_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_root
    unless current_user.id == @box.user.id
      redirect_to root_path
    end
  end
end