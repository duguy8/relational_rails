class SchoolsController < ApplicationController
  def index
    @schools = School.all.order_by_created_at
  end

  def teachers
    @school = School.find(params[:id])
    if !params[:param1].nil?
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
    school = School.new({
      name: params[:school][:name],
      address: params[:school][:address],
      city: params[:school][:city],
      state: params[:school][:state],
      zipcode: params[:school][:zipcode],
      gradeschool: params[:school][:gradeschool]
      })

    school.save
    redirect_to '/schools'
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    school = School.find(params[:id])
    school.update({
      name: params[:school][:name],
      address: params[:school][:address],
      city: params[:school][:city],
      state: params[:school][:state],
      zipcode: params[:school][:zipcode],
      gradeschool: params[:school][:gradeschool]
      })

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
    new_teacher = teachers.create!(
      name: params[:teacher][:name],
      college_graduate: params[:teacher][:college_graduate],
      salary: params[:teacher][:salary]
    )

    new_teacher.save
    redirect_to "/schools/#{school.id}/teachers"
  end
end
