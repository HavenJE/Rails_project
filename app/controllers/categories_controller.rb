class CategoriesController < ApplicationController
    before_action :redirected_if_not_logged_in

    def new
        
        @category = Category.new 
    end 

    def create
        @category = current_user.categorys.build(category_params)
        if @category.save 
            redirect_to categories_path # to redirect to the - Check All categories - page 
        else 
            render :new
        end 
    end  

    private

    def category_params
        params.require(:category).permit(:name)
    end
end
