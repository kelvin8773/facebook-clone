class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      flash[:success] = 'Comment Saved.'
      redirect_to root_path
    else
      flash[:danger] = 'Comment can not be saved.'
      redirect_to root_path
    end

  end

  def show
    
  end

  def edit
  end

  def update
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
