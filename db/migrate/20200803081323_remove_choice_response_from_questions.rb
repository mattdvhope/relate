class RemoveChoiceResponseFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :anon_survey_id
    remove_column :questions, :choice_response_id
    remove_column :questions, :choice_response_type
    add_column :questions, :anon_survey_id, :integer
  end
end
