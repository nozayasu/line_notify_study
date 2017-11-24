Rails.application.routes.draw do
  get "auth" => "line_notifies#auth"
  post "callback" => "line_notifies#callback"
  root to: "line_notifies#index"
  post "bot/callback" => "line_bots#callback"
end
