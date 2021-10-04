class ExercisesController < ApplicationController
    before_action :redirected_if_not_logged_in

    def index 
        # then its nested && we could successfuly find a user - first it setting the value of (after &&) and then its evaluating if @user nil or something? if something, then its true and continues reading the code. 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @exercises = @user.exercises 
        else 
            @error = "That exercise does not exit" if params[:user_id]
            @exercises = Exercise.all 
        end 
    end 

    def new 
        @exercise = Exercise.new 
    end 

    def create
        @exercise = current_user.exercises.build(exercise_params)
        # p @exercise
        if @exercise.save 
            redirect_to exercises_path # to redirect to the - Check All Exercises - page 
        else 
            render :new
        end  
    end 

    def show 
        @exercise = Exercise.find_by_id(params[:id])
        redirect_to exercises_path 
    end 

    # def edit 
    #     @exercise = Exercise.find_by(id: params[:id])
    # end 

    # def update 
    #     @exercise = Exercise.find_by(id: params[:id])
    #     if @exercise.update()
    # end 

    private

    def exercise_params
        params.require(:exercise).permit(:title, :description)
    end 
end

# If the exericse is not saved within the user's all exercises page, its probably because one of the belongs_to relations is not fulfilled 