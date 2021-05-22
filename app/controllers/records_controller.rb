class RecordsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index,:create]
  before_action :validation, only: [:index]
  def index
    @record_place = RecordPlace.new
    render 'records/index'
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
    params.require(:record_place).permit(:pos_code, :area_id, :city, :address, :building, :phone_num).merge(token: params[:token],price: @item.price, item_id: @item.id, user_id:current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_dc5b6a39fd7895cefd9e1bb4"  
    Payjp::Charge.create(
      amount: place_params[:price],  # 商品の値段
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
