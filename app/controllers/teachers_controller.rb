class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all.where(college_graduate: true)
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    teacher = Teacher.find(params[:id])
    teacher.update({
      name: params[:teacher][:name],
      college_graduate: params[:teacher][:college_graduate],
      salary: params[:teacher][:salary]
      })

    teacher.save
    redirect_to "/teachers/#{teacher.id}"
  end

  def destroy
    teacher = Teacher.find(params[:id])
    teacher.destroy

    redirect_to '/teachers'
  end
end
