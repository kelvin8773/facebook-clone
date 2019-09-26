class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.build(like_params)

    if @like.save
      flash[:success] = 'You Liked!'
    else
      flash[:danger] = 'You can not Like!'
    end
    redirect_to root_path
  end

  def destroy
    @like = Like.find_by(id: params[:format])

    if @like.destroy
      flash[:success] = "You Unliked!"
    else
      flash[:danger] = "You can't unlike."
    end
    redirect_to root_url
  end


  private
  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id)
  end

end
