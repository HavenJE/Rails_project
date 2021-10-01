class SessionsController < ApplicationController

    def home 
    end 
    
    def destroy # the logout method 
        session.clear 
        redirect_to root_path # root_pah is similar to '/'
    end 

    def create
        # we need to find a user 
        user = User.find_by(username: params[:user][:username])
        # we need to set if-statement e.g. if there is both username and password, then session 
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id 
            redirect_to user_path(user) # this path = "/users/#{user.id}"
        else 
            flash[:message] = "Incorrect login details, please try again!"
            redirect_to '/login'
        end 
    end  
end

# we don't necessary need to define the login as a method def new in the session_controller because we already named the files nicely 

# in the def create method, we are not creating a new instance, and as we are not updating or changing the instance and so, this form_for is working as similar to form_tag. Both form_for and form_tag are making html, but when form_for sends the code, it asks, do I have a new instance? if yes, then send it to the exercise.user route. 

# @line 14, below user variable, you could write; 
#   if !user 
#       redirect_to  '/signup'
#  the above code may give a hint to someone to hack someone's else form knowing there username is correct, so you don't want to give any information about which part was wrong, username or password? 

# this part of the app that Jennifer recommand using flash messages 
