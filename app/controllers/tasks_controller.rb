class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def complete
    @task = Task.find(params[:id])
    @task.update_attribute(:completed, [true|false])
    redirect_to task_path(@task)
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    if params[:completed].eql?('1')
      @task.completed = true
      @task.save
    end
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
