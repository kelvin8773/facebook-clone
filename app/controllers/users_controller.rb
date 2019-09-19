# frozen_string_literal: true

class UsersController < ApplicationController
  def show; end

  def index
    @users = User.all
  end
end
