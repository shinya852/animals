class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @reptiles = @user.reptiles.page(params[:page]).reverse_order
  end
end
