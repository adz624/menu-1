class Admin::BaseController < ApplicationController
  before_action :login_required, :required_admin!

  protected

  def required_admin!
    redirect_to root_url, notice: '你沒有 admin 權限' unless current_user && current_user.admin?
  end
end