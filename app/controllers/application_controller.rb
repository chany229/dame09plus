class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource_or_scope)
    if current_user.has_role? :admin
      admin_path
    else
      top_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
