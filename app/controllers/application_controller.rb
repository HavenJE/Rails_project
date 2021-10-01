class ApplicationController < ActionController::Base

    # we use helper_method label to enable using these private methods publicly in the views etc - we could also add them in the helpers folder and delete them from here but we need to make sure that we add; - include ApplicationHelper - within the ApplicationController, in line 2. 
    helper_method :current_user, :logged_in? 

    private 

    def current_user
        # if @current_user is already defined then it will = @current_user, otherwise, it will find the session by user_id if there is a session by user_id
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 

    def logged_in?
        !!session[:user_id]
    end 

    def redirected_if_not_logged_in
        redirect_to '/' if !logged_in?
    end 
end

# conditional assignment operator
# ||= is called a conditional assignment operator. It basically works as = but with the exception that if a variable has already been assigned it will do nothing. (don't leave space btw || and = , otherwise, it will produce an error)

# What do we need to add in the application_controller to be able to use these methods in the views? 
# a. we need to make sure that they are labelled as a helper methods 