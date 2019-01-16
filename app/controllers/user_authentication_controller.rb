class UserAuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(user_params[:email], user_params[:password])

    if command.success?
      render json: UserAuthentication.new(auth_token: command.result),
             root: 'user',
             status: :created
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end