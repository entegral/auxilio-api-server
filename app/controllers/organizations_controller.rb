class OrganizationsController < ApplicationController

  def index
    @user = User.find_by!(uid: api_params[:requester_uid])
    if @user
      @organizations = @user.organizations
      json_response(@organizations)
    else
      render json: { message: 'Authentication failed'}
    end
  end

  def show
    if User.find_by!(uid: api_params[:requester_uid])
      @organization = Organization.find_by!(uid: api_params[:uid])
      json_response(@organization)
    else
      render json: { message: 'Authentication failed'}
    end
  end

  def create
    @user = User.find_by!(uid: api_params[:requester_uid])
    if @user
      org_params = {:uid=> api_params[:uid], :name=>api_params[:name]}
      @user.organizations.create!(org_params)
      json_response(@user.organizations, :created)
    else
      render json: { message: 'Authentication failed'}
    end
  end

  def update
    @user = User.find_by!(uid: api_params[:requester_uid])
    if @user
      @organization = Organization.find_by!(uid: api_params[:uid])
      if @organization.update!(api_params)
        render status: 200, json: @user
      end
    else
      render json: { message: 'Authentication failed'}
    end
  end

  def destroy
    if User.find_by!(uid: api_params[:requester_uid])
      @organization = Organization.find_by!(uid: api_params[:uid])
      if @organization.destroy
        render status: 200, json: { message: "User deleted sucessfully"}
      end
    else
      render json: { message: 'Authentication failed'}
    end
  end

  def api_params
    params.permit(:requester_uid, :name, :uid)
  end
end
