# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @post = Post.new
    @like = Like.new
    @comment = Comment.new
    @posts = Post.all
  end
end
