# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:format])
    @comment = Comment.new
    @like = Like.new
  end

  def index
    @users = User.where('id != ?', current_user.id)
  end

end
