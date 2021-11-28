class ReptilesController < ApplicationController

  def new
    @reptile = Reptile.new
  end

  def create
    @reptile = Reptile.new(reptile_params)
    @reptile.user_id = current_user.id
    @reptile.save
    redirect_to reptiles_path
  end

  def index
    @reptiles = Reptile.all
    #左端にユーザー情報を記載
    @user = current_user
  end

  def show
    @reptile = Reptile.find(params[:id])
    @reptile_comment = ReptileComment.new
  end

  def destroy
    @reptile = Reptile.find(params[:id])
    @reptile.destroy
    redirect_to reptiles_path
  end

  def edit
   # @reptile = Reptile.find(params[:id])
    @reptile = Reptile.find(params[:id])
  end

  def update
    @reptile = Reptile.find(params[:id])
    if @reptile = Reptile.update(reptile_params)
      redirect_to reptiles_path
    else
      render 'edit'
    end
  end


  private
  def reptile_params
    params.require(:reptile).permit(:title, :image, :caption)
  end
end
