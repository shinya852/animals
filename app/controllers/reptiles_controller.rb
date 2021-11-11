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
  end

  def show
  end

  def destroy
  end

  private
  def reptile_params
    params.require(:reptile).permit(:title, :image, :caption)
  end
end
