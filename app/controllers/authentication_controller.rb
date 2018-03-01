class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: :authenticate

  def authenticate
    @user = User.find_by_email(params[:email])

    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result,
                     user: @user.as_json(only: [:id, :name, :age, :type_id, :email]) }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def logout
    @user = User.find_by_email(params[:email])
    @user.authentication_token = nil

    @user.save

    head :no_content
  end
end