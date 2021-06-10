class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  #shows all the users

  def index
    render plain: User.all.map { |user| user.to_user_details }.join("\n")
  end

  #creates a new entry(user detail)
  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    if user.save
      session[:current_user_id] = user.id
      redirect_to "/"
    else
      redirect_to new_user_path
      flash[:error] = user.errors.full_messages.join(", ")
    end
  end

  #Checks weather the email and password is already available in the user details and if it is available it will return false else returns a true.
  def login
    email = params[:email]
    password = params[:password_digest]
    user = User.where("email = ?", email).first
    if user == nil
      render plain: "false"
    elsif user.password == password
      render plain: "true"
    else
      render plain: "false"
    end
  end
end
