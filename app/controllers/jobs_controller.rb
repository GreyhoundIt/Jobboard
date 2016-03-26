class JobsController < ApplicationController

  before_action :find_job, only: [:show, :edit, :update, :destroy]
  before_action :set_instance_var, only:[:new, :edit]

  def index
    if params[:category].blank?
			@jobs = Job.all.order("created_at DESC")
		else
			@jobs = Job.where(category: params[:category]).order("created_at DESC")
		end
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(jobs_params)
    if @job.save
      redirect_to @job
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @job.update(jobs_params)
      redirect_to @job
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end


  private

  def find_job
    @job = Job.find(params[:id])
  end

  def jobs_params
    params.require(:job).permit(:title, :description, :company, :url, :category)
  end

  def set_instance_var
    @categories = Job.categories
  end

end
