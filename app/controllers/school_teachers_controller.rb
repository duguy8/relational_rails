class SchoolTeachersController < ApplicationController
  def teachers
    @school = School.find(params[:id])
    if !params[:sort].nil?
      @teachers = @school.teachers.order_by_name
    elsif params[:amount].nil?
      @teachers = @school.teachers
    else
      amount = params[:amount].to_i
      @teachers = @school.teachers.filter_salary(amount)
    end
  end

  def new_teacher
    @school = School.find(params[:id])
  end

  def create_teacher
    school = School.find(params[:id])
    teachers = school.teachers
    new_teacher = teachers.create(teacher_params)

    if new_teacher.save
      redirect_to "/schools/#{school.id}/teachers"
    else
      flash[:notice] = "Teacher not created: Required information missing."
      redirect_to "/schools/#{school.id}/teachers/new"
    end
  end

  private

  def teacher_params
    params.permit(:name, :college_graduate, :salary)
  end
end
