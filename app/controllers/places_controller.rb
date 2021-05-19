class PlacesController < ApplicationController
  before_action :set_item, only: :index
  def index
    render 'orders/index'
  end
 
  def create
    @place = Place.new(place_params)
    
    if @place.save
      redirect_to root_path
    else
      render :index
    end
  end  

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def place_params
    params.require(:place).permit(:pos_code, :area_id, :city, :address, :phone_num)
  end


end
