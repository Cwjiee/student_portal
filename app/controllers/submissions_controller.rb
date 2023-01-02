class SubmissionsController < ApplicationController
  before_action :set_submission, only: %i[ show edit update destroy ]
  before_action :get_assignment_and_course
  before_action :check_user_permission, only: [:create, :update]

  # GET /submissions or /submissions.json
  def index
    @submissions = @assignment.submissions
  end

  # GET /submissions/1 or /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @submission = @assignment.submissions.new
    @assignments = @course.assignments
  end

  # GET /submissions/1/edit
  def edit
    @assignments = @course.assignments
  end

  # POST /submissions or /submissions.json
  def create
    @submission = @assignment.submissions.new(check_user_permission)

    respond_to do |format|
      if @submission.save
        format.html { redirect_to course_assignment_submissions_path(@course, @assignment), notice: "Submission was successfully created." }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions/1 or /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(check_user_permission)
        format.html { redirect_to course_assignment_submissions_path(@course, @assignment), notice: "Submission was successfully updated." }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1 or /submissions/1.json
  def destroy
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to submissions_url, notice: "Submission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_assignment_and_course
      @assignment = Assignment.find(params[:assignment_id])
      @course = Course.find(params[:course_id])
    end

    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def check_user_permission
      if current_user.admin 
        params.require(:submission).permit(:student_id, :assignment_id, :grade, :submission)
      else
        params.require(:submission).permit(:student_id, :assignment_id, :submission)
      end
    end
end