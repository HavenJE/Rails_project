class CategoriesController < ApplicationController
    before_action :redirected_if_not_logged_in

    def index 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @categories = @user.categories.alpha.capitalize 
        else 
            @error = "That category does not exit" if params[:user_id]
            @categories = Category.all  
        end  
    end 

    def new
        
        @category = Category.new 
    end 

    def create
        @category = current_user.categories.build(category_params)
        if @category.save 
            redirect_to categories_path # to redirect to the - Check All categories - page 
        else 
            render :new
        end 
    end  

    def edit 
        @category = Category.find_by(id: params[:id])
        if !@category # if you don't find the category 
            flash[:message] = "Your Category Was Not Found" 
            redirect_to categories_path if !@category || @category.user != current_user  
        end 
        
    end 

    def update 
        @category = Category.find_by(id: params[:id])
        @category.update(category.params)
        redirect_to category_path(@category) 

    end
      

    def destroy 
        @category = Category.find(params[:id]) 
        @category.destroy 
         
        redirect_to exercises_path
    end 

    private

    def category_params
        params.require(:category).permit(:name)
    end
end
