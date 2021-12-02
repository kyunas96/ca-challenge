class CoursesController < ApplicationController

  def index
    courses = Course.all
    render json: courses
  end

  def show

  end

  def create

  end

  def update

  end

  def destroy

  end

end
