# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    @like = Like.new
    @comment = Comment.new
    @posts = Post.all
  end

  def friends
    @user = current_user
  end
end
