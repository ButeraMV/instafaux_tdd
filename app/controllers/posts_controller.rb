class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to @post
    else
      flash[:warning] = "Your post could not be created."
      render :new
    end
  end

  private

    def post_params
      params.require(:post).permit(:caption, :image)
    end
end
