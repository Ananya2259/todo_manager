class UsersController < ApplicationController
  def new
    render "users/new"
  end

  #shows all the users

  def index
    render plain: User.all.map { |user| user.to_user_details }.join("\n")
  end

  #creates a new entry(user detail)
  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    redirect_to "/"
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
