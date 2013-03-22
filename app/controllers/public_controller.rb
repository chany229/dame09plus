# -*- encoding : utf-8 -*-
class PublicController < ApplicationController
  layout "yamato_raven"
  def index
    @date = Time.now
    @tags = Entry.tag_counts_on(:tags).order('count desc')
    respond_to do |format|
      format.html { render :layout => false }
    end
  end
  
  def top
    respond_to do |format|
      format.html
      format.js
    end
  end

  def list
    per_page = AppConfig.entries_perpage
    @page    = params[:page]||1
    @date = Time.now
    @tags = Entry.tag_counts_on(:tags).order('count desc')
    @entries = Entry.order('created_at desc').paginate(:page => @page, :per_page => per_page)
    @hash = "#list"
    @hash += "|p#{@page}" if params[:page]
    @sethash = true unless params[:donotsethash]
    @filter = "全部"
    respond_to do |format|
      format.js
      format.html
    end
  end

  def date
    per_page = AppConfig.entries_perpage
    @page    = params[:page]||1
    now      = Time.now
    @year    = params[:year] ||now.year
    @month   = params[:month]||now.month
    @day     = params[:day]  ||now.day
    @hash    = "#date"
    conditions = []
    if params[:day]
      conditions = ["created_at > ? and created_at < ?", Time.new(@year,@month,@day).beginning_of_day, Time.new(@year,@month,@day).end_of_day]
      @hash += "|y#{@year}|m#{@month}|d#{@day}"
      @filter = "#{@year}年#{@month}月#{@day}日"
    elsif params[:month]
      conditions = ["created_at > ? and created_at < ?", Time.new(@year,@month,1).beginning_of_month, Time.new(@year,@month,1).end_of_month]
      @hash += "|y#{@year}|m#{@month}"
      @filter = "#{@year}年#{@month}月"
    elsif params[:year]
      conditions = ["created_at > ? and created_at < ?", Time.new(@year,1,1).beginning_of_year, Time.new(@year,1,1).end_of_year]
      @hash += "|y#{@year}"
      @filter = "#{@year}年"
    end
    if params[:page]
      @hash += "|p#{@page}"
    end
    @entries = Entry.where(conditions).order('created_at desc').paginate(:page => @page, :per_page => per_page)
    respond_to do |format|
      format.js { render 'search.js.erb' }
    end
  end

  def tag
    per_page = AppConfig.entries_perpage
    @page    = params[:page]||1
    tag      = params[:tag]
    @entries = Entry.tagged_with(tag).order("created_at desc").paginate(:page => @page, :per_page => per_page)
    @hash    = "#tag|#{tag}"
    @hash   += "|p#{@page}" if params[:page]
    @filter = "标签[#{tag}]"
    respond_to do |format|
      format.js { render 'search.js.erb' }
    end
  end

  def keyword
    per_page = AppConfig.entries_perpage
    @page    = params[:page]||1
    keyword  = params[:keyword]
    @entries = Entry.where(["body like ?", "%#{keyword}%"]).order("created_at desc").paginate(:page => @page, :per_page => per_page)
    @hash    = "#keyword|#{keyword}"
    @hash   += "|p#{@page}" if params[:page]
    @filter = "#关键词[#{keyword}]"
    respond_to do |format|
      format.js { render 'search.js.erb' }
    end
  end

  def detail
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def calendar
    @date=Time.at(params[:datetime].to_i)
    respond_to do |format|
      format.js
    end
  end
end
