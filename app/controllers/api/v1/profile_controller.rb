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
  
         #see other people profile
         def showOther
            begin
            @user = User.select(:name, :email, :id).find(params[:id])
            render json: @user
        rescue => e 
            render json: {
                messages: "User not Found",
                is_success: false,
                data: {}
              }, status: :precondition_failed
            end
        end

           
 #list other user
 def listUser
    @users = User.select(:name, :email, :id).where.not(id: current_user.id)
    render json: @users
  end

        
end
