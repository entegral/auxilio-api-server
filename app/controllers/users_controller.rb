class UsersController < ApplicationController

  def index
    @users = User.all
    json_response(@users)
  end

    def show
    @user = User.find_by!(uid: user_params[:uid])
    json_response(@user)
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def update
    @user = User.find_by!(uid: user_params[:uid])
    if @user.update!(user_params)
      render status: 200, json: { message: "User updated successfully" }
    end
  end

  def destroy
    @user = User.find_by!(uid: user_params[:uid])
    if @user.destroy
      render status: 200, json: { message: "User deleted sucessfully"}
    end
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :uid, :first_year_enrolled, :first_year_worked)
  end
end
