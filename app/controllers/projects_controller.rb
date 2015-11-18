class ProjectsController < ApplicationController

  #index
  def index
    @projects = Project.all
  end

  #new
  def new
    @project = Project.new
  end

  #create
  def create
    @project = current_user.projects.create(project_params)
    redirect_to user_project_path(current_user, @project)
  end

  #show
  def show
    @project = Project.find(params[:id])
  end

  #edit
  def edit
    @project = Project.find(params[:id])
  end

  #update
  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to user_project_path(current_user, @project)
  end

  #destroy
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to user_projects_path(current_user)
  end

  private
  def project_params
    params.require(:project).permit(:title, :due_date, :image, :description, :status)
  end
end
