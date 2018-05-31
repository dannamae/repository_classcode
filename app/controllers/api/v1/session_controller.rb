class Api::V1::SessionController < ApplicationController
 # skip_before_action :require_login, only: [:create], raise: :false
 #
 # def current_user
 #   @current_user ||= authentication_auth_token
 # end
 #
 def create
   if user = User.valid_login?(params[:studentnum])
       user.regenerate_auth_token
       render json: {status: 'Sucess', data:user}, status: :ok
   else
     render_unauthorized("Student number not found")
   end
end

 def destroy
   p current_user
   current_user.invalidate_token
   head :ok
 end
end
