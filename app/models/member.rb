class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :description, :address_1, :address_2, :city, :post_code, :remember_me, :name
  validates_presence_of :email, :name, :description, :address_1, :city, :post_code
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :email, :format => { :with => email_regex }
  validates_presence_of :password, :description, :name, :address_1, :address_2, :city, :post_code
  validates_presence_of :description, :length => { :maximum => 60 }
  validates_uniqueness_of :email
end
