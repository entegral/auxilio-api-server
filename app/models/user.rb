class User < ActiveRecord::Base
  validates :uid, :email, :presence => true
  has_and_belongs_to_many :organizations
  # belongs_to :job
end