class UsersController < ApplicationController

    def new 
        @user = User.new # the sign up page 
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id # to keep the user logged in 
            redirect_to @user # to redirect to the show page 
        else 
            render :new
        end   
    end 

    def show 
        redirect_to '/' if !logged_in?
        @user = User.find_by_id(params[:id])
        redirect_to '/home' if !@user 
    end 

    private  

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 
end 


