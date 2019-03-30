class HighScoreUniqueConstraint < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      ALTER TABLE high_scores ADD CONSTRAINT unique_high_score_constraint UNIQUE (first_name, last_name, email, high_score, dublinese_name);
      ALTER  TABLE high_scores
      ALTER COLUMN first_name SET NOT NULL,
      ALTER COLUMN last_name SET NOT NULL,
      ALTER COLUMN high_score SET NOT NULL;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE high_scores DROP CONSTRAINT unique_high_score_constraint;
    SQL
  end
end
