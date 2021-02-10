class TeachersController < ApplicationController
  def index
    if params[:search]
      @teachers = Teacher.search(params[:search])
      @teachers = Teacher.partial_search(params[:search])
    else
      @teachers = Teacher.all.college_graduates
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    teacher = Teacher.find(params[:id])
    teacher.update(teacher_params)
    teacher.save
    redirect_to "/teachers/#{teacher.id}"
  end

  def destroy
    teacher = Teacher.find(params[:id])
    school = teacher.school
    teacher.destroy
    redirect_to "/schools/#{school.id}/teachers"
  end

  private

  def teacher_params
    params.permit(:name, :college_graduate, :salary)
  end
end
