class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end


  def create
    @task = Task.new(good_params)
    @task.save
    redirect_to tasks_path

  end

  def edit
  end

  def update
    @task.update(good_params)
     redirect_to tasks_path

  end

  def destroy
    @task.delete
    redirect_to tasks_path
  end

  private

  def good_params
    params.require(:task).permit(:description, :done)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
