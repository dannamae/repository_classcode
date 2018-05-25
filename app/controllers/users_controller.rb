class UsersController < ApplicationController
  before_action :must_login

  def index
  end

  def create
    user = User.new(user_params)

      if user.save
        redirect_to users_index_path
      else
        render json: {status: 'ERROR', message:'PROFILE NOT SAVED', data:user.errors},status: :bad_request
      end
  end

  def destroy
      @user = User.find(params[:id])
      @user= user.destroy
    end

    private


    def user_params
      params.require(:user).permit(:studentnum, :firstname, :middlename, :lastname, :sectionname, :password)
    end


end
