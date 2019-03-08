class UsersController < ApplicationController

  def index
    @users = User.all
    json_response(@users)
  end

    def show
    @user = User.find(params[:uid])
    json_response(@user)
  end

  def create
    @user = User.create(user_params)
    json_response(@user)
  end

  def update
    @user = User.find(params[:uid])
    @user.update(user_params)
  end

  def destroy
    @user = User.find(params[:uid])
    @user.destroy
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :uid, :first_year_enrolled, :first_year_worked)
  end
end
