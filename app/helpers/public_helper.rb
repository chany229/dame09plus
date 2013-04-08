# -*- encoding : utf-8 -*-
module PublicHelper
  def remote?
    return session[:format] != 'html'
  end
end
