# -*- encoding : utf-8 -*-
class Game < ActiveRecord::Base
	attr_accessible :js_file, :title
	mount_uploader :js_file, JsFileUploader
end
