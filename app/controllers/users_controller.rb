class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      #success
      session[:user_id] = @user.id
      redirect_to '/'
    else
      #failure, redirect to new user page
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
