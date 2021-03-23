class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    # render json: @users
    render json: @users, status: :ok
  end

  def show
    @user = User.find_by(params[:id])  
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      render status: :created
    else
      render json: @user.errors, status: unporcessable_entity
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name)
    
  end
end