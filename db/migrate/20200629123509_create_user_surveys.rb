class CreateUserSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :user_surveys do |t|
      t.integer :user_id
      t.integer :survey_id
      t.timestamps
    end
  end
end
