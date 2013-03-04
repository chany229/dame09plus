class PublicController < ApplicationController
  layout "yamato_raven"
  def index
    @date = Time.now
    @tags = Entry.tag_counts_on(:tags).order('count desc')
  end

  def list
    per_page = AppConfig.entries_perpage
    page     = params[:page]||1
    now      = Time.now
    @year    = params[:year] ||now.year
    @month   = params[:month]||now.month
    @day     = params[:day]  ||now.day
    conditions = []
    if params[:day]
      conditions = ["created_at > ? and created_at < ?", Time.new(@year,@month,@day).beginning_of_day, Time.new(@year,@month,@day).end_of_day]
    elsif params[:month]
      conditions = ["created_at > ? and created_at < ?", Time.new(@year,@month,1).beginning_of_month, Time.new(@year,@month,1).end_of_month]
    elsif params[:year]
      conditions = ["created_at > ? and created_at < ?", Time.new(@year,1,1).beginning_of_year, Time.new(@year,1,1).end_of_year]
    end
    @entries = Entry.where(conditions).order('created_at desc').paginate(:page => page, :per_page => per_page)
  end

  def detail
  end
  
  def calendar
    @date=Time.at(params[:datetime].to_i)
    respond_to do |format|
      format.js
    end
  end
end
