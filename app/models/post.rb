class Post < ActiveRecord::Base
  validates :title, :body, :uid, :presence => true
  has_one :department
  belongs_to :user
end