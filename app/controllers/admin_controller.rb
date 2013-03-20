class AdminController < ApplicationController
  before_filter :should_be_admin
  def index
  end
end
