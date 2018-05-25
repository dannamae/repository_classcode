module Api
  module V1
    class AdminsController < ApplicationController
      def index
        admins = Admin.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'SIGNED UP', data:admins},status: :ok
      end

      def show
        admin = Admin.find(params[:id])
        render json: {status: 'SUCCESS', message:'LOADED PROFILE', data:admin},status: :ok
      end

      def create
        admin = Admin.new(admin_params)
        p params
        if admin.save
          render json: {status: 'SUCCESS', message:'PROFILE SAVED', data:admin},status: :ok
        else
          render json: {status: 'ERROR', message:'PROFILE NOT SAVED', data:admin.errors},status: :unprocessable_entity
        end
      end

      def destroy
        admin = Admin.find(params[:id])
        admin.destroy
        render json: {status: 'SUCCESS', message:'PROFILE DELETED', data:admin},status: :ok
      end

      def update
        admin = Admin.find(params[:id])
        if admin.update_attributes(admin_params)
          render json: {status: 'SUCCESS', message:'PROFILE UPDATED', data:admin},status: :ok
        else
          render json: {status: 'ERROR', message:'PROFILE NOT UPDATED', data:admin.errors},status: :unprocessable_entity
        end
      end

      private

      def admin_params
        params.permit(:firstname, :middlename, :lastname, :subject, :classes, :username, :password)
      end
    end
  end
end
