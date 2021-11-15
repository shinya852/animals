class FavoritesController < ApplicationController

  def create
    reptile = Reptile.find(params[:reptile_id])
    favorite = current_user.favorites.new(reptile_id: reptile.id)
    favorite.save
    redirect_to reptile_path(reptile)
  end

  def destroy
    reptile = Reptile.find(params[:reptile_id])
    favorite = current_user.favorites.find_by(reptile_id: reptile.id)
    favorite.destroy
    redirect_to reptile_path(reptile)
  end

end
  #post_image = PostImage.find(params[:post_image_id])
  #post_image = PostImage.find(params[:post_image_id])
  #favorite = current_user.favorites.new(post_image_id: post_image.id)
  #favorite = current_user.favorites.find_by(post_image_id: post_image.id)