class PostsController < ApplicationController 
  
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save 
      flash[:success] = 'Post created'
      redirect_to root_path
    else
      render 'new'
    end

  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find_by(id: params[:format])
  end
  
  def update
    @post = Post.find_by(id: params[:format])
    if @post.update(post_params)
      flash[:success] = "Post updated!"
      redirect_to root_path
    else
      render "edit"
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:format])
     if @post.destroy
      flash[:danger] = "Post Deleted!"
    end
    redirect_to root_path 
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end

    
end 