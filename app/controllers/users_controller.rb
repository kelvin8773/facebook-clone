# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:format])
    @comment = Comment.new
    @like = Like.new
    @posts = Post.all
    @post = Post.new
    @friendship = Friendship.new
  end

  def index
    @users = User.where('id != ?', current_user.id)
    @friendship = Friendship.new
  end
end
