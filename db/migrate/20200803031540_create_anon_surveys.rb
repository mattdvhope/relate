class CreateAnonSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :anon_surveys do |t|
      t.integer :survey_id
      t.timestamps
    end
  end
end
