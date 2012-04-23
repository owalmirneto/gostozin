class User < ActiveRecord::Base
  has_many :links
  # has_many :categories, through: :links

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  validates_uniqueness_of :email, :username
  
  validates_presence_of :username
  
  # def by_username(username)
  #   where('username = :username', :username => "%#{username}%")
  # end
end
