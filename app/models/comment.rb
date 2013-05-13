class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

  attr_accessible :body, :user_id

  validates_presence_of :body
  validates_length_of :body, within: 2..20


end
