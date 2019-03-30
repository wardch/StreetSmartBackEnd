class HighScoresController < ApplicationController
  def index
    highscores = HighScore.order("created_at DESC")
    render json: highscores
  end

  def create
    highscore = HighScore.create(highscore_param)
    render json: highscore
  end

  def update
    highscore = HighScore.find(params[:id])
    highscore.update_attributes(highscore_param)
    render json: highscore
  end

  def rank
    high_score = highscore_param['high_score']
    new_ranking = HighScore.where('high_score > ?', high_score).count + 1
    render json: new_ranking
  end

  private
  def highscore_param
    params.require(:high_score).permit(:first_name, :last_name, :email, :dublinese_name, :high_score)
  end
end
