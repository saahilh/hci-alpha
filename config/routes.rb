Rails.application.routes.draw do
  resources :lecturers
  resources :courses
  resources :questions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => "application#index"
  get 'index' => "application#index"

  get 'poll_class' => "application#poll_class"

  get 'courses/*id/ask_question' => "courses#show"
  get "login" => "applcation#index"
  get 'select_course' => "application#index"

  get "courses/*id/course_page" => "courses#course_page"

  post "/questions/*id/delete" => "questions#delete"

  post "/courses/create" => "courses#create"
  post "/lecturers/create" => "lecturers#create"

  post 'courses/*id/ask_question' => "courses#ask_question"
  post "login" => "lecturers#login"
  post 'select_course' => "courses#select_course"
end
