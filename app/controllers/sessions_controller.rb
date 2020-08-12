class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: user_params[:name])

    if !@user.authenticate(user_params[:password])
      redirect_to '/login'
    else
      session[:user_id] = @user.id
      redirect_to '/'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :password, :password_confirmation)
  end
end
