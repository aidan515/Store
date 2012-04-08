class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :first_name, :surname, :birthday, :description,:remember_me, :user_image
  attr_accessible :interest_1, :interest_2, :hobby_1, :hobby_2               
  mount_uploader :user_image, UserImageUploader
end
