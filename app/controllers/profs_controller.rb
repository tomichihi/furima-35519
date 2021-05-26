class ProfsController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :set_prof, only: [:edit, :update]
  def index
    @user = User.find(params[:format])
  end
  
  def new
    @prof = Prof.new
  end

  def create
    @prof = Prof.new(prof_params)

    if @prof.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @prof.update(prof_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private
  def prof_params
   params.require(:prof).permit(:hobby, :comment).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_prof
    @prof = Prof.find(params[:id])
  end


end
