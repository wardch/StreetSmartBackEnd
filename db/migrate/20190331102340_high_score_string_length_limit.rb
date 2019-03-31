class HighScoreStringLengthLimit < ActiveRecord::Migration[5.1]
  def change
    execute <<-SQL
    ALTER TABLE "high_scores" ALTER COLUMN "high_score" TYPE varchar(40);
    ALTER TABLE "high_scores" ALTER COLUMN "first_name" TYPE varchar(140);
    ALTER TABLE "high_scores" ALTER COLUMN "last_name" TYPE varchar(140);
    ALTER TABLE "high_scores" ALTER COLUMN "dublinese_name" TYPE varchar(140);
    ALTER TABLE "high_scores" ALTER COLUMN "email" TYPE varchar(140);
    SQL
  end
end
