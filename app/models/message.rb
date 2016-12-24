class Message < ApplicationRecord

  belongs_to :user

  has_many :comments, :dependent => :destroy
  has_many :likes
  has_many :like_users, :through => :likes, :class_name => "User" 
  has_many :subscriptions
  has_many :subscription_users, :through => :likes, :class_name => "User"

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
