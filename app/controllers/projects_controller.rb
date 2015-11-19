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
    @project = current_user.projects.new(project_params)
    if @project.save
      flash[:notice] = "New project created! Go ahead and add the first task."
      redirect_to user_project_path(current_user, @project)
    else
      render :new
    end
  end

  #show
  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks.sort_by &:due_in
  end

  #edit
  def edit
    @project = Project.find(params[:id])
  end

  #update
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Your changes to #{@project.title} bave been saved."
      redirect_to user_project_path(current_user, @project)
    else
      render :edit
    end
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
