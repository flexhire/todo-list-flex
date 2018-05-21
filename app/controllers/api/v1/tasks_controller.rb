class Api::V1::TasksController < Api::ApplicationController
  before_action :authenticate
  before_action :set_task, only: %i[show edit update destroy status]
  skip_before_action :verify_authenticity_token, only: %i[create update destroy]

  def index
    render json: tasks.map(&:serialize)
  end

  def show
    render json: @task.serialize, status: 201
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task.serialize, status: 201
    else
      invalid_error(@task)
    end
  end

  def update
    if @task.update(task_params)
      render json: @task.serialize, status: 201
    else
      invalid_error(@task)
    end
  end

  def destroy
    @task.destroy
    head :ok
  end

  private

  def task_params
    params.require(:task).permit(:name, :due_date, :priority, :user_id, :doit)
  end

  def set_task
    @task = Task.find(params[:id] || params[:task_id])
  end
end
