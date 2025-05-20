class TasksController < ApplicationController

  def index
      @tasks = Task.all
  end
  def show
    @task = Task.find_by(id: params[:id])
  end

  def create
  @task = Task.new(task_params)
  redirect_to task_path(@task)
  end

  def new
  @task = Task.new
  end

  def edit
  @task = Task.find_by(params[:id])
  end

  def update
    @task = Task.find(params[:id])
  if @task.update(task_params)
    redirect_to task_path(@task)
  else
    render :edit
    end
  end

  def destroy
  @task = Task.find_by(params[:id])
  @task.destroy
end


  private
  def task_params
  params.require(:task).permit(:title, :details, :completed)
  end
end
