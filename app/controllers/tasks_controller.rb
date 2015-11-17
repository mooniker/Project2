class TasksController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
  end

  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.update(task_params)
  end

  private
  def task_params
    params.require(:task).permit(:name, :priority, :due_date).merge(status: 'todo')
  end
end
