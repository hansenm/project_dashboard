class StatusReportsController < ApplicationController

  before_filter :load_status_report, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.find(params[:project_id])
    @status_report = StatusReport.new
  end
  
  def create
    @project = Project.find(params[:project_id])
    @status_report = StatusReport.new(status_report_params)
    @status_report.project = @project
    if @status_report.save
      redirect_to project_status_report_path(@status_report.project, @status_report)
    else
      render :new
    end
  end

  def edit
    @project = @status_report.project
  end
  
  def update
    @project = @status_report.project
    if @status_report.update_attributes(status_report_params)
      redirect_to project_status_report_path(@status_report.project, @status_report)
    else
      render :edit
    end
  end

  def show
  end
  
  def destroy
    @project = @status_report.project
    @status_report.destroy
    redirect_to @project
  end
  
  private
    def load_status_report
      @status_report = StatusReport.find(params[:id])
    end
  
    def status_report_params
      params.require(:status_report).permit(:summary, :overall, :scope, :schedule, :resources, :reported_at, :project_id)
    end
end
