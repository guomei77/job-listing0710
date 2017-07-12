class ResumesController < ApplicationController


  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end
  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_parmas)
    @resume.job = @job
    @resume.user = current_user
    if @resume.save
      flash[:notice] = "Success"
      redirect_to job_path(@job)
    else
      render :new
    end
  end
private
 def resume_parmas
  params.require(:resume).permit(:content, :attachment)
 end
end
