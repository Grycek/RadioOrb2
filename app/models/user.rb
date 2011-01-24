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
  
  has_many :votes
  has_many :survey_answers
  
  def is_presenter
      return (not broadcasts.empty?)
  end
  
  #return true if user has voted on last chart
  def has_voted
      return votes.where(:chart_id => Chart.last_chart).any?
  end
  
  def has_answered_for_last_survey
      return survey_answers.where(:survey_id => Survey.last_survey.id).any?
  end
end
