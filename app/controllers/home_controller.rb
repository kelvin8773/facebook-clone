# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end
end
