# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
    @comment = Comment.new
  end
end
