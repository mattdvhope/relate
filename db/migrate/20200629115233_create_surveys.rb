class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :title
      t.timestamps
    end

    create_table :users_surveys, id: false do |t|
      t.belongs_to :user
      t.belongs_to :survey
    end
  end
end
