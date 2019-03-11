class User < ActiveRecord::Base
  validates :uid, :email, :presence => true
  has_and_belongs_to_many :organizations
end