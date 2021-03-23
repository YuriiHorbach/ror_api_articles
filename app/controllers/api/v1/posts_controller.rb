class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.order('created_at DESC')
    render json: @posts
  end

  def show
    @post = Post.find_by(params[:id])  
    render json: @post
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save 
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end