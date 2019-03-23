class UsersController < ApplicationController

  def index
    if User.find_by!(uid: user_params[:uid])
      @users = User.all
      json_response(@users)
    else
      render status: 401, json: { message: 'Authentication failed'}
    end
  end

    def show
    @user = User.find_by!(uid: user_params[:uid])
    puts user_params[:uid]
    json_response(@user)
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def update
    @user = User.find_by!(uid: user_params[:uid])
    if @user.update!(user_params)
      json_response(@user)
    end
  end

  def destroy
    @user = User.find_by!(uid: user_params[:uid])
    if @user.destroy
      render status: 200, json: { message: "User deleted sucessfully"}
    end
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :uid, :id)
  end
end
