class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.integer :question_id
      t.string :title
      t.boolean :selected

      t.timestamps
    end
  end
end
