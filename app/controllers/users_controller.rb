class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /todos
  def create
    @user = User.new(user_params)
    @user.password = '123456'
    @user.save!

    json_response(@user, :created)
  end

  # GET /todos/:id
  def show
    json_response(@user)
  end

  # PUT /todos/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    # whitelist params
    params.permit(:name, :type_id, :age, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
