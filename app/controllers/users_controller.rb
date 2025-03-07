class UsersController < ApplicationController
  before_action :require_authentication

  def edit
    @user = Current.user
  end

  def update_profile
  end

  def manage_password
  end

  def update_password
  end
end
