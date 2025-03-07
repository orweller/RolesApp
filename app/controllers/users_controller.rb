class UsersController < ApplicationController
  before_action :require_authentication

  def edit
    @user = Current.user
  end

  def update_profile
    @user = Current.user
    if @user.update(user_params)
      redirect_to edit_user_profile_path, notice: "Profile updated."
    else
      render :edit
    end
  end

  def manage_password
  end

  def update_password
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email_address)
  end
end
