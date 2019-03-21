class ActionsController < ApplicationController

    def index

    @user = User.find_by!(uid: user_params[:requester_uid]) 
    if @user
 
      case user_params[:apiAction]
        when 'addExistingOrgToUser'
          @org = Organization.find_by!(uid: user_params[:org_uid])
          if @org && @org.password
            if @org.password == user_params[:org_password]
              @user.organizations << @org
              json_response(@user.organizations)
            else
              render json: { message: 'Org password incorrect' }
            end
          elsif @org
            @user.organizations << @org
            json_response(@user.organizations)
          else
            render json: { message: 'Organization not found' }
          end
        when 'addNewOrgToUser'
          if user_params[:org_password]
            @org = Organization.create!({ :uid=>user_params[:org_uid], :name=>user_params[:org_name], :password=> user_params[:org_password] })
          else
            @org = Organization.create!({ :uid=>user_params[:org_uid], :name=>user_params[:org_name], :password=>nil })
          end
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
          @orgs = Organization.all.where(encrypted_password: nil).limit(10)
          puts @orgs
          json_response(@orgs)
        when 'updateUser'
          @user = User.find_by!(uid: user_params[:requester_uid])
          puts '*************'
          puts 'user found:'
          puts @user
          puts '*************'
          new_params = {:uid=> user_params[:requester_uid], :first_name => user_params[:first_name], :last_name => user_params[:last_name]}
          if @user.update!(new_params)
            json_response(@user)
          end
        else
          render json: { message: 'Unrecognized action provided' }
      end
    else
      render json: { message: 'Authentication failed'}
    end
  end


  def user_params
    params.permit(:requester_uid, :org_uid, :org_name, :org_password, :apiAction, :first_name, :last_name)
  end

end