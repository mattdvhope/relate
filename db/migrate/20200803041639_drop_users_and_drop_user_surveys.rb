class DropUsersAndDropUserSurveys < ActiveRecord::Migration[6.0]
  def change
    drop_table :users
    drop_table :user_surveys
  end
end
