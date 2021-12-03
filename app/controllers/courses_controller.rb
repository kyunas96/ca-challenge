class CoursesController < ApplicationController

  def index
    courses = Course.all
    render json: courses
  end

  def show
    course = Course.find_by(id: course_params[:id])

    if(course)
      render json: course
    else
      render json: {error: "exist"}
    end

  end

  def create
    course = 

  end

  def update

  end

  def destroy

  end

  def course_params
    params.permit(:id, :name, :release_date)
  end

end
