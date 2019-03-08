class UsersController < ApplicationController

  def index
    @users = {"1": {
      first_name: 'rob',
      last_name: 'b',
      email: 'email@gmail.com',
      first_year_attended: 2013,
      first_year_worked: 2013
      }
    }
    json_response(@users)
  end

  private
  def json_response(object)
    render json: object, status: :ok
  end
end