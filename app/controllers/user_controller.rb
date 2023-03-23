class UserController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(username: params[:username], password: params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect_to "/", notice: "User successfully created" 
        else
            render 'new', notice: "Something went wrong"
        end
    end
    
    private

    def user_params 
        params.require(:user).permit(:username, :password)
    end    
end
