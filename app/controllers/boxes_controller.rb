class BoxesController < ApplicationController
  before_action :move_to_session, only: %i[edit]
  before_action :set_box, only: %i[edit update destroy]

  def index
    @boxes = Box.includes(:user)
  end

  def create
    @box = Box.create(name: params[:name], position: params[:position], user_id: current_user.id)
    render json: { box: box }
    redirect_to box_connects_path(@box)
  end

  def edit
    move_to_root
  end

  def update
    if @box.update(box_params)
      redirect_to box_connects_path(@box)
    else
      render :edit
    end
  end

  def destroy
    connects = @box.connects
    @box.destroy_all_history
    if @box.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def box_params
    params.require(:box).permit(:name, :position).merge(user_id: current_user.id)
  end

  def set_box
    @box = Box.find(params[:id])
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_root
    redirect_to root_path unless current_user.id == @box.user.id
  end
end
