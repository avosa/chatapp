class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:show, :edit, :update, :destroy, :like]
  before_action :owned_job, only: [:edit, :update, :destroy]

  def index
    @jobs = Job.of_followed_users(current_user.following).order('created_at DESC').page params[:page]
    # @jobs = Job.all.order('created_at DESC').page params[:page]
  end

  def new
    @job = current_user.jobs.build
  end

  def create
    @job = current_user.jobs.build(job_params)
    if @job.save
      flash[:success] = "Your job has been created!"
      redirect_to jobs_path
    else
      flash.now[:alert] = "Your new job couldn't be created!  Please check the form."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.update(job_params)
      flash[:success] = "Job updated."
      redirect_to jobs_path
    else
      flash.now[:alert] = "Job update failed.  Please check the form."
      render :edit
    end
  end

  def destroy
    if @job.destroy
      flash[:success] = "Job successfully deleted."
      redirect_to jobs_path
    else
      flash.now[:alert] = "Job deleteion failed.  Please try again."
      render :edit
    end
  end

  def like
    if @job.liked_by current_user
        respond_to do |format|
          format.html { redirect_to :back }
          format.js
        end
      end
  end

  def browse
    @jobs = Job.all.order('created_at DESC').page params[:page]
  end

  private

  def job_params
    params.require(:job).permit(:image, :title)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def owned_job
    unless current_user == @job.user
      flash[:alert] = "That job doesn't belong to you!"
      redirect_to root_path
    end
  end

end
