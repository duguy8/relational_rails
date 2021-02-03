class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
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
end
