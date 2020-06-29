class SurveysAddContentfulId < ActiveRecord::Migration[6.0]
  def change
    add_column :surveys, :contentful_id, :string
  end
end
