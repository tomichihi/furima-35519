class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index,:create]
  before_action :validation, only: [:index, :create]
                                                    
  def index                                  
    @record_place = RecordPlace.new                                     
  end                           
                      
  def create              
    @record_place = RecordPlace.new(place_params)

    if @record_place.valid?
      pay_item
      @record_place.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def place_params
    params.require(:record_place).permit(:pos_code, :area_id, :city, :address, :building, :phone_num).merge(token: params[:token],item_id: @item.id, user_id:current_user.id)
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(                        
      amount: @item.price,  # 商品の値段
      card: place_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end 
  
  def validation
    if @item.user_id == current_user.id || @item.record != nil
    redirect_to root_path
    end
  end 

end
  