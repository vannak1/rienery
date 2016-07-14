class EnrollmentsController < ApplicationController
  def create
    if current_user.enrollments.find_by(course_id: params[:course_id]).nil?
      current_user.enrollments.create(course_id: params[:course_id])
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @enrollment = current_user.enrollments.find_by(course_id: params[:course_id])
    @enrollment.destroy

    redirect_to request.referrer
  end
end
