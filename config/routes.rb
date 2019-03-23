Rails.application.routes.draw do
  resources :high_scores
  scope 'api/v1' do
    resources :high_scores
  end
end
