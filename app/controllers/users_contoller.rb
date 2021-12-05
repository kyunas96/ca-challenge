=begin
class UsersController < ApplicationController

  def create
    @user = User.new(
      username: user_params[:username],
      password: user_params[:password]
    )

    @errors = []

    if @user.save
      render json: {@user.id}
    else
      @errors = @user.errors.full_messages
      render json: @errors, status: 422
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

=end