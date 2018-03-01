class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @tasks = Task.all

    @tasks = @tasks.where(assignee_id: params[:assignee_id]) if params[:assignee_id].present?

    json_response(@tasks.to_json(include: [:creator, :assignee]))
  end

  # POST /todos
  def create
    @task = Task.create!(task_params)
    json_response(@task, :created)
  end

  # GET /todos/:id
  def show
    # json_response(@task.as_json(include: [:creator, :assignee, feedbacks: :creator]))
  end

  # PUT /todos/:id
  def update
    @task.update(task_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @task.destroy
    head :no_content
  end

  private

  def task_params
    # whitelist params
    params.permit(:title, :body, :creator_id, :assignee_id)
  end

  def set_task
    @task = Task.includes(:creator, :assignee, feedbacks: :creator).find(params[:id])
  end
end
