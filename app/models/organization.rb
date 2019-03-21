class Organization < ActiveRecord::Base
  validates :uid, :name, :presence => true
  secret_key = ENV['DB_COL_ENCRYPTED_KEY']
  attr_encrypted :password, :key => secret_key
  has_and_belongs_to_many :users
  has_many :departments
end