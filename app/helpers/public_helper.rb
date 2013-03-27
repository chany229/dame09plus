# -*- encoding : utf-8 -*-
module PublicHelper
  def remote?
    return session[:format] == 'js'
  end
end
