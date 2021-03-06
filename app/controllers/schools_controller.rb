class SchoolsController < ApplicationController
  def index
    if params[:sort] == "by_num_of_teachers"
      @schools = School.order_by_teacher_count
    elsif params[:search]
      @schools = School.search(params[:search])
      if @schools.empty?
        @schools = School.partial_search(params[:search])
      end  
    else
      @schools = School.all.order_by_created_at
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
    if school.save
      redirect_to "/schools"
    else
      flash[:notice] = "School not created: Required information missing."
      render :new
    end
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

  private

  def school_params
    params.permit(:name, :address, :city, :state, :zipcode, :gradeschool)
  end
end
