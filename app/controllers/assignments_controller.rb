class AssignmentsController < ApplicationController
  before_action :set_assignment, only: %i[ show edit update destroy ]
  before_action :get_course
  skip_before_action :get_course, only: [:main]

  # GET /assignments or /assignments.json
  def main
    @courses = Course.all
  end

  def index
    @assignments = @course.assignments
  end

  # GET /assignments/1 or /assignments/1.json
  def show
    @students = @course.students
    #@students = Student.left_outer_joins(:submissions).where(submissions: { assignment_id: @assignment.id }).or(@course.students)
  end

  # GET /assignments/new
  def new
    @assignment = @course.assignments.new
  end

  # GET /assignments/1/edit
  def edit
    @assignments = @course.assignments
  end

  # POST /assignments or /assignments.json
  def create
    @assignment = @course.assignments.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to course_assignments_url(@course), notice: "Assignment was successfully created." }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1 or /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to course_assignment_url(@course, @assignment), notice: "Assignment was successfully updated." }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1 or /assignments/1.json
  def destroy
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to course_assignments_url(@course), notice: "Assignment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_course
      @course = Course.find(params[:course_id])
    end

    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assignment_params
      params.require(:assignment).permit(:course_id, :title, :description, :marks)
    end
end