Rails.application.routes.draw do
  get "auth" => "line_notifies#auth"
  post "callback" => "line_notifies#callback"
end
