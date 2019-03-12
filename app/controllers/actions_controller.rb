class ActionsController < ApplicationController

    def index

    @user = User.find_by!(uid: user_params[:requester_uid]) 
    if @user
 
      case user_params[:apiAction]
        when 'addExistingOrgToUser'
          @org = Organization.find_by!(uid: user_params[:org_uid])
          if @org
            @user.organizations << @org
            json_response(@user.organizations)
          else
            render json: { message: 'Organization not found' }
          end
        when 'addNewOrgToUser'
          @org = Organization.create!({:uid=>user_params[:org_uid], :name=>user_params[:org_name]})
          if @org
            @user.organizations << @org
            json_response(@user.organizations)
          else
            render json: { message: 'Internal server error, org not created'}
          end
        when 'removeOrgFromUser'
          if @user.organizations.delete(Organization.find_by!(:uid=> user_params[:org_uid]))
            json_response(@user.organizations)
          else
            render json: { message: 'Internal server error, org not removed'}
          end
        when 'getPublicOrgs'
          @orgs = Organization.all.limit(10)
          puts @orgs
          json_response(@orgs)
        else
          render json: { message: 'Unrecognized action provided' }
      end
    else
      render json: { message: 'Authentication failed'}
    end
  end


  def user_params
    params.permit(:requester_uid, :org_uid, :org_name, :apiAction)
  end

end