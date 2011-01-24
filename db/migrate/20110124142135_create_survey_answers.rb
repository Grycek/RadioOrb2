class CreateSurveyAnswers < ActiveRecord::Migration
  def self.up
    create_table :survey_answers do |t|
      t.integer :survey_question_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :survey_answers
  end
end
