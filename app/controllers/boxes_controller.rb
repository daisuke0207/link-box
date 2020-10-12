class BoxesController < ApplicationController

  def index
  end

  def create
    box = Box.create(box_params)
    render json:{box: box}
  end

  private

  def box_params
    params.require(:box).permit(:name, :position).merge(user_id: current_user.id)
  end
end