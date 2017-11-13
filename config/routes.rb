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
  get 'courses/*id/poll_class' => 'polls#new'

  get "courses/*id/end_poll" => "polls#new"
  get "courses/*id/begin_poll" => "polls#new"

  post "/questions/*id/delete" => "questions#delete"
  post "/questions/*id/in_class" => "questions#in_class"
  post "/questions/*id/after_class" => "questions#after_class"
  post "/questions/*id/thumbsup" => "questions#thumbsup"
  post "/questions/*id/thumbsdown" => "questions#thumbsdown"

  post "/courses/create" => "courses#create"
  post "/lecturers/create" => "lecturers#create"

  post 'courses/*id/ask_question' => "courses#ask_question"
  post 'courses/*id/delete' => "courses#delete"
  post "courses/*id/begin_poll" => "polls#create"
  post "courses/*id/end_poll" => "polls#end"

  post "courses/*id/answer_poll" => "polls#answer"

  post "login" => "lecturers#login"
  post 'select_course' => "courses#select_course"
end
