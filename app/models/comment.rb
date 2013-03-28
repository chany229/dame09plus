# -*- encoding: utf-8 -*-
class Comment < ActiveRecord::Base
  resourcify
  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  validates_uniqueness_of :comment, :scope => [:commentable_id, :commentable_type], :message => "不能重复提交。"

  #default_scope :order => 'created_at ASC'


  attr_accessible :user_id, :comment, :commentable_id, :commentable_type, :username
  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user
end
