class AdminController < ApplicationController
 

  def record
    @students = if params[:studentSearch]
      Student.where("name LIKE ? OR lastname LIKE ? OR usn LIKE ?", "%#{params[:studentSearch]}%", "%#{params[:studentSearch]}%", "%#{params[:studentSearch]}%")

    else
      Student.all
    end
    render 'record'
  end

  def view
    @student = Student.find(params[:id])
    @attendances = @student.s_attendances.includes(:activities)
  end

  def addform
  end

  def addstudentfunction
    existing_student = Student.find_by(usn: params["usn"])

    if existing_student.nil?
      @student = Student.new(
        name: params["name"].capitalize,
        lastname: params["lastname"].capitalize,
        usn: params["usn"],
        course: params["course"],
        year: params["year"],
        birth_day: params["bday"]
      )

      if @student.save
        redirect_to '/admin/attendance'
      else
        flash[:alert] = "Failed to add student"
        render 'addform'
      end
    else
      flash[:alert] = "A student with the same USN already exists"
      redirect_to '/admin/add'
    end
  end

  def deletestudent
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = "Deleted successfully"
    redirect_to '/admin/attendance'
  end
  
 def attendancerecord
      @records = Student.includes(s_attendances: [:activities]).all
  
end

def edit
  @student = Student.find(params[:id])

end

def update
  @student = Student.find(params[:id])
  if @student.update(name: params["name"], lastname: params["lname"], usn: params["usn"],
   year: params["year"], course: params["course"], birth_day: params["bday"])
    redirect_to  '/admin/attendance'
  else
    render 'edit'
  end
end


def login
 

end

def adminacc

admin =  Admin.find_by(username: params["user"],password: params["pass"])
  if admin
    session[:admin_id] = admin.id
    redirect_to  '/admin/attendance'
  else 
    redirect_to '/admin/login'
  end
end

def logout
  session[:admin_id] = nil
  redirect_to '/admin/login'
end

    


end
