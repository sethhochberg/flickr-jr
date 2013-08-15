require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  has_many :photos, :through => :albums
  has_many :albums

  validates :email, :name, presence: true
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    user = find_by_email(email)
    user.password == password ? user : false
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
end
