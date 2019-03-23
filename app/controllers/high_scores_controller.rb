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

  def destroy
    highscore = HighScore.find(params[:id])
    highscore.destroy
    head :no_content, status: :ok
  end

  private
    def highscore_param
      params.require(:highscore).permit(:first_name, :last_name, :high_score, :email, :dublinese_name)
    end
end
