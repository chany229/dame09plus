class Article < ActiveRecord::Base
  resourcify
  attr_accessible :body, :entry_id

  belongs_to :entry
end
