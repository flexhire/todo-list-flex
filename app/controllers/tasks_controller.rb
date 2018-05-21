class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :status]

  def index
    @tasks = tasks
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def status
    if @task.update(task_params)
      flash[:success] = 'Task was successfully updated.'
    else
      flash[:error] = 'Error updating task'
    end

    redirect_to tasks_path
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'Task was successfully created.'
      redirect_to tasks_path
    else
      flash[:error] = 'Error creating task'
      render :new
    end
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'Task was successfully updated.'
      redirect_to edit_task_path(@task)
    else
      flash[:error] = 'Error updating task'
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = 'Task was successfully destroyed.'
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id] || params[:task_id])
  end

  def task_params
    params.require(:task).permit(:name, :due_date, :priority, :user_id, :doit)
  end
end
