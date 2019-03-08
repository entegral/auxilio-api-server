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
    json_response(@user)
  end

  def update
    @user = User.find_by!(uid: user_params[:uid])
    @user.update(user_params)
  end

  def destroy
    @user = User.find_by!(uid: user_params[:uid])
    @user.destroy
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :uid, :first_year_enrolled, :first_year_worked)
  end
end
