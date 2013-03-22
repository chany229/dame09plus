# -*- encoding : utf-8 -*-
class Article < ActiveRecord::Base
  resourcify
  
  attr_accessible :body, :entry_body, :tags
  attr_accessor :entry_body, :tags

  belongs_to :entry
  
  before_create :create_entry
  before_update :update_entry
  before_save :gsub_body
  
  def create_entry
    entry = Entry.new
    entry.body = self.entry_body
    entry.tags_with_space = self.tags
    entry.save
    self.entry = entry
  end
  
  def update_entry
    entry = self.entry
    entry.body = self.entry_body
    entry.tags_with_space = self.tags
    entry.save
  end
  
  def gsub_body
    self.body = self.body.blank? ? "" : self.body.gsub(/\r\n/," \n").gsub(/ +/," ")
  end
end
