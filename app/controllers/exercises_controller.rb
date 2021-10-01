class ExercisesController < ApplicationController
    before_action :redirected_if_not_logged_in

    def new 
        @exercise = Exercise.new 
    end 

    def create
        @exercise = current_user.exercises.build(exercise_params)
        if @exercise.save 
            redirect_to exercises_path # to redirect to the - Check All Exercises - page 
        else 
            render :new
        end  
    end 

    private

    def exercise_params
        params.require(:exercise).permit(:title, :description)
    end 
end

# If the exericse is not saved within the user's all exercises page, its probably because one of the belongs_to relations is not fulfilled 