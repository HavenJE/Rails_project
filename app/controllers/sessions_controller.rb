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

    def google
        # find_or_create_by a user using the attributes from the auth or from the 3ed party site - we also use the do block to add other attributes of the user e.g. username, email 
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.username = auth["info"]["first_name"]
            user.password = SecureRandom.hex(10) # this will randomanlly generate google password 
        end 
        if @user.save
            session[:user_id] = @user.id # to make sure that the user is saved 
            redirect_to user_path(@user)
        else 
            redirect_to '/'
        end 
    end

    private 

    def auth
        request.env['omniauth.auth']
    end
 
end

# we don't necessary need to define the login as a method def new in the session_controller because we already named the files nicely 

# in the def create method, we are not creating a new instance, and as we are not updating or changing the instance and so, this form_for is working as similar to form_tag. Both form_for and form_tag are making html, but when form_for sends the code, it asks, do I have a new instance? if yes, then send it to the exercise.user route. 

# @line 14, below user variable, you could write; 
#   if !user 
#       redirect_to  '/signup'
#  the above code may give a hint to someone to hack someone's else form knowing there username is correct, so you don't want to give any information about which part was wrong, username or password? 

# this part of the app that Jennifer recommand using flash messages 

# @line 28, we don't assign password_digest directly in thta line, because if we do, it will bypass all encryption - we only use password_digest when we want to create the table - SecureRandom.hex(10) this will randomanlly generate google password 

# in line 26, the code: User.find_or_create_by - if it finds something, it will skip the code in line 26 and 27 and it will never change anything, it only does that when its creating a user. 

