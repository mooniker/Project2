class TasksController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    redirect_to user_project_path(current_user, @project)
  end

  def show
    @task = Task.find(params[:id])
    @due_in = @task.due_in
    @task.set_priority
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to user_project_task_path(current_user, @project, @task)
  end

  private

  def task_params
    params.require(:task).permit(:name, :priority, :due_date, :status)
  end
end
