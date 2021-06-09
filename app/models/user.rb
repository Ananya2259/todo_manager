class User < ActiveRecord::Base
  has_many :todos
  has_secure_password

  def to_user_details
    " Email:#{email} Password:#{password}"
  end
end
