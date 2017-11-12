Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => "application#index"
  get 'index' => "application#index"
  get 'ask_question' => "application#ask_question"
  get 'poll_class' => "application#poll_class"
  get 'course_page' => "application#course_page"
  get 'prof-ile' => "application#profile"
end
