class CoursesController < ApplicationController

  def index
    courses = Course.all
    render json: courses
  end

  def show
    course = Course.find_by(id: course_params[:id])

    if course
      render json: course
      return
    else
      render json: {error: "Course does not exist"}
      return
    end

  end

=begin
  course_params: {
    name: string,
    release_date: {
      month: int,
      day: int,
      hour: int,
      minute: int
    }
  }
=end

  def create
    # course_params[:release_date] must be a hash that has values for month,
    # day, year and time

    formatted_release_date = DateTime.new(
      course_params[:release_date][:year],
      course_params[:release_date][:month],
      course_params[:release_date][:day],
      course_params[:release_date][:hour],
      course_params[:release_date][:minute],
    )    

    course = Course.new(
      name: course_params[:name], 
      release_date: formatted_release_date,
      created_at: Time.now,
      update_at: Time.now
    )

    if course.save
      render json: course
    else
      render json: {error: "Unable to save course"}
    end


    

  end

  def update
    course = Course.find_by(id: course_params[:id])

    if(course)
      

    else
      render json: {error: "Course does not exist"}
    end
  end

  def destroy

  end

  def course_params
    params.permit(:id, :name, :release_date)
  end

end
