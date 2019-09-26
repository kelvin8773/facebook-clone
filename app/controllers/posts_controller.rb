# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created'
      redirect_to root_path
    else
      flash[:danger] = 'content cant be empty or less than 10 letter'
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find_by(id: params[:format])
    @like = Like.new
    @posts = Post.all
    @comment = Comment.new
  end

  def update
    @post = Post.find_by(id: params[:format])
    @posts = Post.all
    @comment = Comment.new
    if @post.update(post_params)
      flash[:success] = 'Post updated!'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find_by(id: params[:format])
    flash[:danger] = 'Post Deleted!' if @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
