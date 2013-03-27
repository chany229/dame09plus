class Admin::CommentsController < ApplicationController
  def index
    @page = params[:page] || 1
    @last_readed_comment_id = AppConfig[:last_readed_comment_id] || 0
    @comments = Comment.order("created_at desc").paginate(:page => @page, :per_page => 20)
    if @page == 1
      AppConfig[:last_readed_comment_id] = @comments.first.id
    end
  end
end
