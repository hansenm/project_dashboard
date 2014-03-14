class ProjectsController < ApplicationController
  def index
  end

  def new
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

  def show
  end
  
  private
    
    # Create project parameters white list
    def project_params
      params.require(:project).permit(:name, :manager, :organization)
    end
end
