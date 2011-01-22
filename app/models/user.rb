class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :presenters
  has_many :broadcasts, :through => :presenters
  
  has_many :comments
  
  has_many :articles
  
  def is_presenter
      return (not broadcasts.empty?)
  end
end
