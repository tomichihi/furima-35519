class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :user_validation, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update 

   if @item.update(item_params)
     redirect_to item_path
   else
     render :edit
   end
   
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
  
  def user_validation
   unless current_user.id == @item.user_id
    redirect_to action: :index
   end 
  end
  
  def item_params
    params.require(:item).permit(:title, :price, :catch_copy, :category_id, :condition_id, :fee_id, :area_id, :days_id,
                                 :image).merge(user_id: current_user.id)
  end
end
