# -*- encoding : utf-8 -*-
class AdminController < ApplicationController
  before_filter :should_be_admin
  def index
  end
  
  def setting
    AppConfig.entries_perpage = params[:entries_perpage]
    AppConfig.notice = params[:notice]
    flash[:notice] = "配置修改成功"
    redirect_to admin_path
  end
end
