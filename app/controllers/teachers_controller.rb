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
