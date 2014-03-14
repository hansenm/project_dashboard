class ProjectsController < ApplicationController
  
  before_filter :load_project, :only => [:show, :edit, :update, :destroy]
  
  def index
  end

  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit
    
  end
  
  def update
    if @project.update_attributes(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def show
    @project = Project.find(params[:id])
  end
  
  def destroy
    @project.destroy
    redirect_to projects_path
  end
  
  private
    
    # Create project parameters white list
    def project_params
      params.require(:project).permit(:name, :manager, :organization)
    end
    
    def load_project
      @project = Project.find(params[:id]) || raise("not found") # not_found
    end
end
