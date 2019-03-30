Rails.application.routes.draw do
  resources :high_scores
  scope 'api/v1' do
    post 'rank', to: 'high_scores#rank'
    resources :high_scores
  end
end
