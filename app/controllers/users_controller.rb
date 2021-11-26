class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @reptiles = @user.reptiles.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def index
    @users = User.all
    @user = current_user
    @users = User.where.not(id: current_user.id)
  end

   #フォロワー機能
  def following
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end


   private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end


end
