class Article < ActiveRecord::Base
  attr_accessible :body, :entry_id

  belongs_to :entry
end
