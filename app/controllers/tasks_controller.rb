class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  # need separate method / action for the get request ...
  def new
    @task = Task.new
  end

  # ... and the post request
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
