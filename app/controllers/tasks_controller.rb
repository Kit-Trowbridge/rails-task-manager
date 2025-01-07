class TasksController < ApplicationController
  # Read

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  # Create

  # need separate method / action for the get request ...
  def new
    # this is why we get a blank form
    @task = Task.new
  end

  # ... and the post request
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  # Update

  def edit
    # this is why we get a filled in form
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    # need to give task something to update with (task_params hash corresponds with SQL values... I think)
    @task.update(task_params)
    redirect_to task_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
