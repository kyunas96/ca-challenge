=begin
class SessionController < ApplicationController

  # when a user logs in, create a new session and use the login method
  # inherited from the ApplicationController superclass

  def create
    @user = User.find_by_credentials(params[:username], params[:password])

    if @user
      login(@user)
      return user
    else
      render json: {errors: ["Incorrect username and password combination"]}, 
        status: 422
    end
  end

  def destroy
    logout
  end
end

=end