class Organization < ActiveRecord::Base
  validates :uid, :name, :presence => true
  has_and_belongs_to_many :users
  has_many :departments
end