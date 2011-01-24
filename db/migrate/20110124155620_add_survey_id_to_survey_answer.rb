class AddSurveyIdToSurveyAnswer < ActiveRecord::Migration
  def self.up
    add_column :survey_answers, :survey_id, :integer
  end

  def self.down
    remove_column :survey_answers, :survey_id
  end
end
