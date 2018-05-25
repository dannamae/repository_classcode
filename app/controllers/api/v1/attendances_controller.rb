module Api
  module V1
    class AttendancesController < ApplicationController
      def index
        attendances = Attendance.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'SIGNED UP', data:attendances},status: :ok
      end

      def show
        attendance = Attendance.find(params[:id])
        render json: {status: 'SUCCESS', message:'LOADED PROFILE', data:attendance},status: :ok
      end

      def create
        attendance = Attendance.new(attendance_params)

        if attendance.save
          render json: {status: 'SUCCESS', message:'PROFILE SAVED', data:attendance},status: :ok
        else
          render json: {status: 'ERROR', message:'PROFILE NOT SAVED', data:attendance.errors},status: :unprocessable_entity
        end
      end

      def destroy
        attendance = Attendance.find(params[:id])
        attendance.destroy
        render json: {status: 'SUCCESS', message:'PROFILE DELETED', data:attendance},status: :ok
      end

      def update
        attendance = Attendance.find(params[:id])
        if attendance.update_attributes(attendance_params)
          render json: {status: 'SUCCESS', message:'PROFILE UPDATED', data:attendance},status: :ok
        else
          render json: {status: 'ERROR', message:'PROFILE NOT UPDATED', data:attendance.errors},status: :unprocessable_entity
        end
      end

      private

      def attendance_params
        params.permit(:date, :time, :studentnum, :firstname, :lastname, :attendance)
      end
    end
  end
end
