module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'SIGNED UP', data:users},status: :ok
      end

      def show
        user = User.find(params[:id])
        render json:{status: 'SUCCESS', message:'LOADED PROFILE', data:user},status: :ok
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: {status: 'SUCCESS', message:'PROFILE SAVED', data:user},status: :ok
          flash[:success] = "Welcome to the Sample App!"
        else
          render json: {status: 'ERROR', message:'PROFILE NOT SAVED', data:user.errors},status: :unprocessable_entity
          flash[:success] = "Welcome to the Sample App!"
        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {status: 'SUCCESS', message:'PROFILE DELETED', data:user},status: :ok
      end

      def update
        user = User.find(params[:id])
        if user.update_attributes(user_params)
          render json: {status: 'SUCCESS', message:'PROFILE UPDATED', data:user},status: :ok
        else
          render json: {status: 'ERROR', message:'PROFILE NOT UPDATED', data:user.errors},status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:studentnum, :firstname, :middlename, :lastname)
      end
    end
  end
end
