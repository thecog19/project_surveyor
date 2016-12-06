
Rails.application.routes.draw do
  get 'survey_responses/new'

  root to: "surveys#index"

  resources :surveys do
    resources :questions
    resources :survey_responses
  end
end
