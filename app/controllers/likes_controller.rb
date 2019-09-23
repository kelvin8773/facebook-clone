class LikesController < ApplicationController
  
  def create
    @like = current_user.likes.build(like_params)

    if @like.save
      flash[:success] = 'You Liked!'
    else
      flash[:danger] = 'You can not Like!'
    end
    redirect_to root_path
  end
  

  private
  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id)
  end

end
