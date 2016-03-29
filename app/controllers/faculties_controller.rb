class FacultiesController < ApplicationController
  layout 'admin'
  before_action :set_faculty, only: [:show, :edit, :update, :destroy, :invisible]
  before_filter :confirm_logged_in, only: [:new, :edit, :index, :invisible]
  def index
    @faculties = Faculty.all
  end

  # GET /products/1
  # GET /products/1.json
  def show

  end

  # GET /products/new
  def new
    @faculty = Faculty.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @faculty = Faculty.new(faculty_params)

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to faculties_path, notice: 'faculty was successfully created.' }
        format.json { render :show, status: :created, location: @faculty }
      else
        format.html { render :new }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculties/1
  # PATCH/PUT /faculties/1.json
  def update
    respond_to do |format|
      if @faculty.update(faculty_params)
        format.html { redirect_to faculties_path, notice: 'faculty was successfully updated.' }
        format.json { render :show, status: :ok, location: @faculty }
      else
        format.html { render :edit }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculties/1
  # DELETE /faculties/1.json
  def destroy
    @faculty.destroy
    respond_to do |format|
      format.html { redirect_to faculties_path, notice: 'Faculty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def invisible
    @faculty.invisible
    @faculty.save
    respond_to do |format|
      format.html { redirect_to faculties_path }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_faculty
    @faculty = Faculty.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def faculty_params
    params.require(:faculty).permit(:name, :description, :short, :visible)
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
