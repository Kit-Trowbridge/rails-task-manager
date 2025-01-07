Rails.application.routes.draw do
  get 'tasks', to: 'tasks#index'
  # must place tasks/new first bc of rails flow - it has the static path over tasks/:id
  get 'tasks/new', to: 'tasks#new'
  get 'tasks/:id', to: 'tasks#show', as: :task
  post 'tasks', to: 'tasks#create'
  get 'tasks/:id/edit', to: 'tasks#edit', as: :task_update
end
