Rails.application.routes.draw do
  get 'applicants/new'

  post 'applicants/create'

  get 'login' => 'session#new'

  post 'session/create'

  get 'test' => 'test#test'

  get 'main' => 'test#index'

  get 'get' => 'test#get'

  root :to => "session#new"
end
