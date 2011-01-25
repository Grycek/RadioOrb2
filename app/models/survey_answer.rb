class SurveyAnswer < ActiveRecord::Base
    validates :survey_question_id, :user_id, :presence => true
    belongs_to :user
    belongs_to :survey_question
    belongs_to :survey
    validates_uniqueness_of :user_id, :scope => [:survey_id]
end
