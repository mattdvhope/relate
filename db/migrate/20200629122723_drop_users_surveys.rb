class DropUsersSurveys < ActiveRecord::Migration[6.0]
  def change
    drop_table :users_surveys
  end
end
