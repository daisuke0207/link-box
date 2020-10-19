class ConnectsController < ApplicationController
  def index
    @box = Box.find(params[:box_id])
    @connects = @box.connects.includes(:user)

    # agent = Mechanize.new
    # @connects.each do |connect|
    #   @page = agent.get(connect.link)
    #   @title = @page.title
    #   @image = @page.image_with(:src => /logo/)
    #   @img = @page.search('link')
    # end
  end

  def create
    @box = Box.find(params[:box_id])
    @connect = @box.connects.new(connect_params)
    if @connect.save
      redirect_to :index
    else
      render :index
    end
  end

  private

  def connect_params
    params.require(:connect).permit(:title, :link, position: 1).merge(user: current_user.id)
  end
end