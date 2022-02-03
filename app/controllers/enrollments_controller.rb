class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all

    # Find the enrolled courses of a current user
    enrollments = current_user.enrollments.select(:course_id).to_ary
    course_ids = enrollments.pluck(:course_id)
    @enrolled_courses = Course.where(id: course_ids)

  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    unless is_already_enrolled
      if is_overlapped_time
        flash[:warning] = 'Your timetable conflicts with this course'
      else
        @enrollment = Enrollment.new(enrollment_params)
        if @enrollment.save
          flash[:info] = 'You successfully enrolled this course'
          redirect_to courses_path
        end
      end

    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    redirect_to courses_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.permit(:user_id, :course_id)
    end

    def user_courses
      # Find the enrolled courses of a current user
      enrollments = current_user.enrollments.select(:course_id).to_ary
      course_ids = enrollments.pluck(:course_id)
      @courses = Course.where(id: course_ids)
      return @courses
    end

    def is_already_enrolled
      if !Enrollment.find_by(user_id: params[:user_id], course_id: params[:course_id]).nil?
        flash[:danger] = 'You already have enrolled this course'
        redirect_to courses_path
        return true
      end
      return false
    end

    def is_overlapped_time
      new_course = Course.find(params[:course_id])

      new_course_start_time = new_course.start_time.strftime("%H").to_i  
      new_course_end_time = new_course.end_time.strftime("%H").to_i  

      new_course_dayofweek = new_course.dayofweek

      enrolled_courses = user_courses

      enrolled_courses.each do |enrolled_course|
        enrolled_course_start_time = enrolled_course.start_time.strftime("%H").to_i  
        enrolled_course_end_time = enrolled_course.end_time.strftime("%H").to_i  

        enrolled_course_dayofweek = enrolled_course.dayofweek

        unless !(enrolled_course_dayofweek & new_course_dayofweek).any?
          if ((enrolled_course_start_time < new_course_end_time) && (new_course_start_time < enrolled_course_end_time)) ||
            ((enrolled_course_start_time > new_course_end_time) && (new_course_start_time < enrolled_course_end_time))
            flash[:warning] = 'Your timetable conflicts with this course'
            redirect_to courses_path
            return true
          else
            return false
        end
      end
      end
      return false
    end
end
