# -*- encoding : utf-8 -*-
class Entry < ActiveRecord::Base
  resourcify
  acts_as_taggable
  acts_as_commentable
  
  attr_accessible :body, :tags_with_space
  attr_accessor :tags_with_space
  
  validates :tags_with_space, :length => { :maximum => 15 }

  has_one :article

  before_save :split_tags
  def split_tags
    if self.tags_with_space
      self.tag_list = self.tags_with_space.split(" ").join(',')
    end
  end
end
