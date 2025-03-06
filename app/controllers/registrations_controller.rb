class RegistrationsController < ApplicationController
  allow_unauthenticated_access

  layout "registration"

  def new
    redirect_to root_path if authenticated?

    @user = User.new
  end

  def create
    @user = User.new(new_user_params)
    if @user.save
      start_new_session_for @user
      redirect_to after_authentication_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def new_user_params
    params.permit(:email_address, :password)
  end
end
