class CoursesController < ApplicationController
  layout 'admin'
  before_action :set_course, only: [:show, :edit, :update, :destroy, :invisible]
  before_filter :confirm_logged_in, only: [:new, :edit, :index, :invisible]
  def index
    @courses = Course.all
  end

  # GET /products/1
  # GET /products/1.json
  def show

  end

  # GET /products/new
  def new
    @course = Course.new
    2.times { @course.pros.build }
    3.times { @course.criterions.build }
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_path, notice: 'course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to courses_path, notice: 'course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_path, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def invisible
    @course.invisible
    @course.save
    respond_to do |format|
      format.html { redirect_to courses_path }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.require(:course).permit(:name, :code, :visible, :faculty_id, :level, :semester, :mode, :seats, :fee, pros_attributes: [:id, :course, :description, :_destroy], criterions_attributes: [:id, :course , :seats, :description, :_destroy])
  end

  def resolve_layout
    case action_name
      when "show", "search"
        "application"
      else
        "admin"
    end
  end
end
