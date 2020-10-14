class BoxesController < ApplicationController

  def index
    @boxes = Box.includes(:user)
  end

  def create
    box = Box.create(name: params[:name], position: 1, user_id: current_user.id)
    render json: { box: box }
  end
end