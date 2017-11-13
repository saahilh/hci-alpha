class LecturersController < ActionController::Base
  def login
    lecturer = Lecturer.where(email: params[:email])
    if(lecturer.count != 0 && lecturer.first.password==params[:pw])
      redirect_to "/lecturers/#{lecturer.first.id}"
    else
      render 'message', locals:{ msg: "Invalid credentials entered", href: "/index.html" }
    end
  end

  def show
  	render 'prof-ile', locals:{lecturer: Lecturer.find(params[:id])}
  end

  def create
    if(params[:pw]!=params[:cpw])
      msg = "Error: passwords do not match"
    elsif params[:pw].blank?||params[:name].blank?||params[:email].blank?
      msg = "Error: left a field blank"
    elsif Lecturer.where(email: params[:email]).count!=0
      msg = "Error: account with that mail already exists"
    else
      msg = "Successfully created account"
      Lecturer.create(name: params[:name], password: params[:pw], email: params[:email])
    end
    # render 'message', locals:{ msg: msg, href: "/index.html" }
  end
end