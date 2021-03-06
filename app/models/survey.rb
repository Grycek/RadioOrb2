class Survey < ActiveRecord::Base
    attr_accessible :question
    validates :question, :presence => true
    has_many :survey_questions, :dependent => :destroy
    has_many :survey_answers, :dependent => :destroy
    
    def self.last_survey
        return Survey.last
    end
    
end
