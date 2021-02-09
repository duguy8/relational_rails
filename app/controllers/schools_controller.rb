class SchoolsController < ApplicationController
  def index
    if params[:sort] == "by_num_of_teachers"
      @schools = School.order_by_teacher_count
    elsif params[:search]
      @schools = School.search(params[:search])
      @schools = School.partial_search(params[:search])
    else
      @schools = School.all.order_by_created_at
    end
  end

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

  def show
    @school = School.find(params[:id])
    @teachers = @school.teachers.count
  end

  def new
  end

  def create
    school = School.new(school_params)

    school.save
    redirect_to '/schools'
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    school = School.find(params[:id])
    school.update(school_params)

    school.save
    redirect_to "/schools/#{school.id}"
  end

  def destroy
    School.destroy(params[:id])
    redirect_to '/schools'
  end

  def new_teacher
    @school = School.find(params[:id])
  end

  def create_teacher
    school = School.find(params[:id])
    teachers = school.teachers
    new_teacher = teachers.create!(teacher_params)

    new_teacher.save
    redirect_to "/schools/#{school.id}/teachers"
  end

  private

  def school_params
    params.permit(:name, :address, :city, :state, :zipcode, :gradeschool)
  end

  def teacher_params
    params.permit(:name, :college_graduate, :salary)
  end
end
