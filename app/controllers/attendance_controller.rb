class AttendanceController < ApplicationController
  def index
  end

  def time_in_out
    student = Student.find_by(usn: params[:usn])
    if student
      if params[:selected] == "time_in"
        if student.s_attendances.last.nil? || student.s_attendances.last.time_out.present?

          attendance = student.s_attendances.create(time_in: Time.now) 
          activity = attendance.activities.create(reason: params[:reason])
          
          flash[:notice] = "Time in successful for #{student.name}"
        else
          flash[:alert] = "Student already timed in"
        end
      elsif params[:selected] == "time_out"
        last_attendance = student.s_attendances.last
        if last_attendance.nil?
          flash[:alert] = "Student not timed in"
        elsif last_attendance.time_out.present?
          flash[:alert] = "Student already timed out"
        else
          last_attendance.update(time_out: Time.now)
          flash[:notice] = "Time out successful for #{student.name}"
        end
      end
    else
      flash[:alert] = "USN not found"
    end
  
    redirect_to root_path
  end
  
  
end
