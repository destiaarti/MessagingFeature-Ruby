class Api::V1::ProfileController < ApplicationController
    before_action :authenticate_user!
   #see myprofile
        def show
            @name = current_user.name
            @email = current_user.email
            @password = current_user.encrypted_password
            response = { :name => @name, :email => @email, :password => @password }
            render json: response
        end
  
end