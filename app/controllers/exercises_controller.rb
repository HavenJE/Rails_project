class ExercisesController < ApplicationController
    before_action :redirected_if_not_logged_in
    # before_action :set_exercise, only: [:show, :edit, :update]

    def index 
        # then its nested && we could successfuly find a user - first it setting the value of (after &&) and then its evaluating if @user nil or something? if something, then its true and continues reading the code. 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @exercises = @user.exercises.alpha.capitalize 
        else 
            @error = "That exercise does not exit" if params[:user_id]
            @exercises = Exercise.all.alpha  
        end 
    end 

    def new 
        @exercise = Exercise.new 
        @exercise.build_category
    end 

    def create
        # raise params.inspect 
        @exercise = current_user.exercises.build(exercise_params)
        # p @exercise
        if @exercise.save 
            redirect_to exercises_path # to redirect to the - Check All Exercises - page 
        else 
            render :new
        end  
    end 

    def show 
        @exercise = Exercise.find_by(id: params[:id])
    end 

    def edit 
        @exercise = Exercise.find_by(id: params[:id])
        redirect_to exercises_path if !@exericse || @exericse.user != current_user
    end 

    def update 
        @exercise = Exercise.find_by(id: params[:id])
        redirect_to exercises_path @exericse.user != current_user
        if @exercise.update(exericse.params)
            redirect_to exercise_path(@exercise) 
        else 
            render :edit 
        end
      

        def destroy 
            @exericse = Exercise.find(params[:id])
            @exericse.clear # or .destroy 
            redirect_to exercises_path
        end 
    end 

    private

    def exercise_params
        params.require(:exercise).permit(:title, :description, category_attributes:[:name])
    end 

    # def set_exercise
    #     @exercise = Exercise.find_by(id: params[:id])
    #     if !@exericse # if you don't find the exercise 
    #         flash[:message] = "Your Exercise Was Not Found" 
    #         redirect_to exercises_path
    #     end 
    # end 
    
end

# If the exericse is not saved within the user's all exercises page, its probably because one of the belongs_to relations is not fulfilled 

# the advantage of using find_by is that it does not raise an error 

# queries like; where, order, grouping, or any of those SQL words => that's probably a hint that it should be moved to your model. 

# <%= link_to "Delete", user_exercises_path, method::destroy %>