class SessionsController < ApplicationController

    def create 
    @user = User.find_by(name: user_params[:name])
       
    if @user.authenticate(user_params[:password]) 
        session[:user_id] = @user.id
        redirect_to '/'
        else
        redirect_to '/login'
        end
    end

    private

    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
