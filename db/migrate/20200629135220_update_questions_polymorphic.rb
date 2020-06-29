class UpdateQuestionsPolymorphic < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :survey_id
    add_column :questions, :choice_response_id, :integer
    add_column :questions, :choice_response_type, :string
  end
end
