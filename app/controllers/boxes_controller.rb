class BoxesController < ApplicationController

  def index
    @boxes = Box.includes(:user)
  end

  def edit
    
  end

  def destroy
    box = Box.find(params[:id])
    if box.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  def update
    
  end

  def create
    box = Box.create(name: params[:name], position: 1, user_id: current_user.id)
    render json: { box: box }
  end
end