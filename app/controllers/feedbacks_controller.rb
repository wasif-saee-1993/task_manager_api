class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @feedbacks = Feedback.all
    json_response(@feedbacks)
  end

  # POST /todos
  def create
    @feedback = Feedback.create!(feedback_params)
    json_response(@feedback, :created)
  end

  # GET /todos/:id
  def show
    json_response(@feedback)
  end

  # PUT /todos/:id
  def update
    @feedback.update(feedback_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @feedback.destroy
    head :no_content
  end

  private

  def feedback_params
    # whitelist params
    params.permit(:comment, :creator_id, :task_id)
  end

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end
end
