class ApplicationController < ActionController::Base
  def index
  	render 'index.html'
  end

  def poll_class
  	render 'poll_class.html'
  end
end
