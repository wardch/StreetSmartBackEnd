class HighScoresController < ApplicationController
  def index
    high_scores = HighScore.order("high_score DESC").page(params[:page] || 1).per(100)
    high_score_data = {high_scores: high_scores, total_pages: high_scores.total_pages}
    render json: high_score_data
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
    new_ranking = HighScore.where('high_score::decimal > ?', high_score.to_f).count + 1
    render json: new_ranking
  end

  private
  def highscore_param
    params.require(:high_score).permit(:first_name, :last_name, :email, :dublinese_name, :high_score)
  end
end
