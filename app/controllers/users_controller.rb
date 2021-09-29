class UsersController < ApplicationController
  before_action :move_to_signed_in
  def index
    @users = User.all
    @user=User.find_by(id: current_user.id)
    @book=Book.new
  end
  def new
    @book = Book.new
  end

  def show
    @book=Book.new
    @user = User.find(params[:id])
    @books=Book.where(user_id: @user.id)
  end

  def destroy
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "successfully"
       redirect_to user_path(@user.id)
    else
      render 'users/edit'
    end
  end
  def edit
    @user = User.find(params[:id])
    if @user.id!=current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def move_to_signed_in
    unless user_signed_in?

      redirect_to  '/users/sign_in'
    end
  end
end
