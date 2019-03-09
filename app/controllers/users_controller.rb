class UsersController < ApplicationController
  include UserDto

  def create
    user = User.new(user_params)
    if user.save
      render json: { success_msg: "User successfully created." }, status: 200
    else
      render json: "User could not be created.", status: 400
    end
  end

  def show
    user_id = params[:id]
    user_dto = find_user_dto(user_id)
    if user_dto
      render json: { user: user_dto }, status: 200
    else
      render json: "User not found.", status: 404
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
