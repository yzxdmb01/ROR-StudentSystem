Rails.application.routes.draw do
  get 'applicants/new'
  get 'applicants/del' => 'applicants#del'
  get 'applicants/add' => 'applicants#add'

  post 'applicants/create'

  get 'login' => 'session#new'

  post 'session/create'

  get 'test' => 'test#test'

  get 'main' => 'admin#index'

  get 'admin/list' => 'admin#list'

  root :to => "session#new"
end
