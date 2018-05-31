class AttendanceController < ApplicationController

  def create
    attendance = Attendance.new(attendace_params)

      if attendace.save
        redirect_to attendance_show_path
      else
        render json: {status: 'ERROR', message:'PROFILE NOT SAVED', data:attendance.errors},status: :bad_request
      end
  end

  def destroy
      @attendance = Attendance.find(params[:id])
      @attendance = Attendance.destroy
    end

    private


    def attendance_params
      params.require(:attendance).permit(:date, :attendance)
    end


end
