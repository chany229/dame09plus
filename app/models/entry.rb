class Entry < ActiveRecord::Base
  acts_as_taggable
  acts_as_commentable
  attr_accessible :body
end
