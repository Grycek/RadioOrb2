class SurveyQuestion < ActiveRecord::Base
    validates :answer, :survey_id, :presence => true
    belongs_to :survey
    has_many :survey_answers, :dependent => :destroy
end
