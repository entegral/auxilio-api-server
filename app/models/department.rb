class Department < ActiveRecord::Base
  validates :uid, :name, :presence => true
  belongs_to :organization
  has_many :jobs
end