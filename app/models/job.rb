class Job < ActiveRecord::Base
  validates :title, :presence => true
  belongs_to :department
  has_one :user
end