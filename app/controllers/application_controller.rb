class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  	render 'index.html'
  end

  def ask_question
    render 'ask_question.html'
  end

  def course_page
  	render 'course_page.html'
  end

  def poll_class
  	render 'poll_class.html'
  end

  def profile
    render 'prof-ile.html'
  end
end
