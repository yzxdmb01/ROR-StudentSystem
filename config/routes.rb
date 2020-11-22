Rails.application.routes.draw do
  get 'applicants/new'
  get 'applicants/del' => 'applicants#del'
  get 'applicants/add' => 'applicants#add'
  post 'applicants/create'

  get 'login' => 'session#new'

  post 'session/create'

  get 'main' => 'admin#index'

  get 'admin/list' => 'admin#list'

  get 'classes/index' => 'classes/index'
  get 'classes/list' => 'classes/list'
  delete 'classes/del' => 'classes/del'
  put 'classes/update' => 'classes/update'
  post 'classes/create' => 'classes/create'

  get 'students/list' => 'students/list'
  resources :students

  root :to => "session#new"
end
