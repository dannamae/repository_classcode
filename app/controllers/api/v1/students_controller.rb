module Api
  module V1
    class StudentsController < ApplicationController
      def index
        students = Student.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'SIGNED UP', data:students},status: :ok
      end

      def show
        student = Student.find(params[:id])
        render json:{status: 'SUCCESS', message:'LOADED PROFILE', data:student},status: :ok
      end

      def create
        student = Student.new(student_params)

        if student.save
          render json: {status: 'SUCCESS', message:'PROFILE SAVED', data:student},status: :ok
        else
          render json: {status: 'ERROR', message:'PROFILE NOT SAVED', data:student.errors},status: :unprocessable_entity
        end
      end

      def destroy
        student = Student.find(params[:id])
        student.destroy
        render json: {status: 'SUCCESS', message:'PROFILE DELETED', data:student},status: :ok
      end

      def update
        student = Student.find(params[:id])
        if student.update_attributes(student_params)
          render json: {status: 'SUCCESS', message:'PROFILE UPDATED', data:student},status: :ok
        else
          render json: {status: 'ERROR', message:'PROFILE NOT UPDATED', data:student.errors},status: :unprocessable_entity
        end
      end

      private

      def student_params
        params.permit(:studentnum, :firstname, :middlename, :lastname, :sectionname, :password)
      end
    end
  end
end
