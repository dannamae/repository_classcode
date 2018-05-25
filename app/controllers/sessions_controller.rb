class SessionsController < ApplicationController
  before_action :check_session, only: [:new]

  def new
    @admin = Admin.new
  end

  def create
      @admin = Admin.find_by(username: params[:admin][:username])
      if @admin && @admin.authenticate(params[:admin][:password])
        session[:user_id] = @admin.id
        redirect_to users_index_path
      else
        redirect_to login_path
      end
  end

  def destroy
      session[:user_id] = nil
      redirect_to login_path
  end

  private
    def check_session
      redirect_to users_index_path unless current_user.blank?
    end
end
