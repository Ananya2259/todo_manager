class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  #shows all the users
  def index
    render plain: User.all.map { |user| user.to_user_details }.join("\n")
  end

  #creates a new entry(user detail)
  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create(name: name, email: email, password: password)
    response_text = "New username created with #{name}"
    render plain: response_text
  end

  #Checks weather the email and password is already available in the user details and if it is available it will return false else returns a true.
  def login
    email = params[:email]
    password = params[:password]
    useremail = User.where("email = ?", email).first
    userpassword = User.where("password = ?", password).first
    if useremail != nil && userpassword != nil
      render plain: "true"
    else
      render plain: "false"
    end
  end
end
