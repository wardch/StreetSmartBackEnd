class CreateHighScores < ActiveRecord::Migration[5.1]
  def change
    create_table :high_scores do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.float :high_score
      t.string :dublinese_name

      t.timestamps
    end
  end
end
