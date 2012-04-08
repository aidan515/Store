class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :first_name, :surname, :birthday, :description,:remember_me, :user_image
  attr_accessible :interest_1, :interest_2, :hobby_1, :hobby_2
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :email, :format => { :with => email_regex }
  validates_presence_of :password, :description, :first_name, :surname, :birthday
  validates_presence_of :description, :length => { :maximum => 60 }
  validates_uniqueness_of :email               
  mount_uploader :user_image, UserImageUploader
end
