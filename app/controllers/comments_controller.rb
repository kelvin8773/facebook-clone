# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      flash[:success] = 'Comment Saved.'
    else
      flash[:danger] = 'Comment can not be saved.'
    end
    redirect_to root_path
  end

  def show; end

  def edit
    @comment = Comment.find_by(id: params[:format])
    @post = Post.find_by(id: params[:format])
    @posts = Post.all
  end

  def update
    @comment = Comment.find_by(id: params[:format])
    @post = Post.find_by(id: params[:format])
    @posts = Post.all
    @comments = Comment.all
    if @comment.update(comment_params)
      flash[:success] = 'Comment updated!'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:format])
    flash[:danger] = 'Comment Deleted!' if @comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
