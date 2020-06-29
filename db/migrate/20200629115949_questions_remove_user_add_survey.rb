class QuestionsRemoveUserAddSurvey < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :user_id
    add_column :questions, :survey_id, :integer
  end
end
