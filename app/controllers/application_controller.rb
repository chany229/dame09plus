# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource_or_scope)
    ability = Ability.new(current_user)
    if ability.can? :manage, :all
      admin_path
    else
      top_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  
  def check_format
    if cookies[:format] and not session[:format]
      session[:format] = cookies[:format]
    end
  end

  def should_be_admin
    unless current_user && current_user.has_role?("admin")
      redirect_to top_path, :alert => "您没有操作权限"
    end
  end
end
