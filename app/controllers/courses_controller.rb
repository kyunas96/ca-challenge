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

  def create
    # on the frontend use a <input type="date" /> to ensure that the values passed
    # to the backend are valid dates

    # course_params[:release_date] must be a hash that has values for month,
    # day, year and time

    formatted_release_date = DateTime.new(
      course_params[:release_date][:year].to_i,
      course_params[:release_date][:month].to_i,
      course_params[:release_date][:day].to_i,
      course_params[:release_date][:hour].to_i,
      course_params[:release_date][:minute].to_i,
    )    

    course = Course.new(
      name: course_params[:name], 
      release_date: formatted_release_date,
      created_at: DateTime.now,
      updated_at: DateTime.now
    )

    if course.save
      render json: course
      return
    else
      render json: {error: "Unable to save course"}
      return
    end
  end

  def update
    course = Course.find_by(id: course_params[:id])
    new_release_date = nil

    if course_params[:release_date]
        new_release_date = DateTime.new(
          course_params[:release_date][:year].to_i,
          course_params[:release_date][:month].to_i,
          course_params[:release_date][:day].to_i,
          course_params[:release_date][:hour].to_i,
          course_params[:release_date][:minute].to_i
        )
    end

    if(course)
      course.name = course_params[:name] ? course_params[:name] : course.name
      course.release_date = new_release_date ? new_release_date : course.release_date
      course.updated_at = DateTime.now

      if course.save
        render json: course, status: 200
        return
      else
        render json: {error: ["Unable to update course"]}
        return
      end
    else
      render json: {error: "Course does not exist"}
      return
    end
  end

  def destroy
    course = Course.find_by(id: course_params[:id])

    # Were users and auth to be implemented, logic would be implemented to check
    # if the current user was an administrator with delete permissions

    if(course)
      course.destroy
      render json: {message: "Course successfully deleted"}, status: 200
      return
    else
      render json: {error: "Course does not exist"}, status: 422
      return
    end

  end


=begin
Postman form structure
[name] : string
[release_date][year] : string
[release_date][month] : string
[release_date][day] : string
[release_date][hour] : string
[release_Date][minute] : string
=end

=begin
course_params return value
  course_params: {
    name: string,
    release_date: {
      year: string,
      month: string,
      day: string,
      hour: string,
      minute: string
    }
  }
=end

  def course_params
    params.permit(
      :id, 
      :name, 
      :release_date => [:year, :month, :day, :hour, :minute]\
    )
  end

end
