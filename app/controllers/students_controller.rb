class StudentsController < ApplicationController
  def backdoor

  end
 
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show 
    
    @student = Student.find(params[:id])
  end

  def index 
    
    if params[:search] == "" 
      @students = Student.all 
    else 
      params[:search] != "" || params[:search] != nil 
      
    @students = Student.where(name: params[:search])
    #@students.count == 0 ? @students = Student.all : @students = Student.where(name: params[:search])
    end 
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown, :search)
  end
end
