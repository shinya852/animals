class ReptileCommentsController < ApplicationController

  def create
    reptile = Reptile.find(params[:reptile_id])
    comment = current_user.reptile_comments.new(reptile_comment_params)
    comment.reptile_id = reptile.id
    comment.save
    redirect_to reptile_path(reptile)
  end

  def destroy
  end

  private
  def reptile_comment_params
    params.require(:reptile_comment).permit(:comment)
  end

end
