class AddAnonSurveyIdToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :anon_survey_id, :string
  end
end
