class Entry < ActiveRecord::Base
  acts_as_taggable
  acts_as_commentable
  
  attr_accessible :body,:tags_with_space
  attr_accessor :tags_with_space
  
  before_save :split_tags
  def split_tags
    if self.tags_with_space
      self.tag_list = self.tags_with_space.split(" ").join(',')
    end
  end
end
