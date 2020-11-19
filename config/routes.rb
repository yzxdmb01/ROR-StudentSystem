Rails.application.routes.draw do
  get 'applicants/new'

  post 'applicants/create'

  get 'login' => 'session#new'

  post 'session/create'

  get 'test' => 'test#test'
end
