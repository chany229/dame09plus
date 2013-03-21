class AdminController < ApplicationController
  before_filter :should_be_admin
  def index
  end
  
  def setting
    AppConfig.entries_perpage = params[:entries_perpage]
    redirect_to admin_path
  end
end
